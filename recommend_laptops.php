<?php
header('Content-Type: application/json; charset=utf-8');

// Read JSON body
$raw = file_get_contents('php://input');
if (!$raw) {
    echo json_encode([]);
    exit;
}
$data = json_decode($raw, true);
if (!$data || !isset($data['answers'])) {
    echo json_encode([]);
    exit;
}
$answers = $data['answers'];
// expected for laptop: [tujuan, budget, battery, gpu_need, screen_size]

// map indices to DB values
$purposeMap = [
    0 => 'Office',
    1 => 'Desain / Editing',
    2 => 'Gaming',
    3 => 'Kuliah / Sekolah'
];
$budgetMap = [
    0 => ['max' => 5000000],
    1 => ['min' => 5000000, 'max' => 10000000],
    2 => ['min' => 10000000, 'max' => 20000000],
    3 => ['min' => 20000000]
];
$gpuMap = [
    0 => 'none', // Tidak
    1 => 'light',
    2 => 'medium',
    3 => 'heavy'
];
$screenMap = [
    0 => ['min' => 12.0, 'max' => 13.5],
    1 => ['min' => 13.5, 'max' => 14.5],
    2 => ['min' => 15.0, 'max' => 16.9],
    3 => ['min' => 17.0]
];

$conds = [];

// purpose
if (isset($answers[0]) && isset($purposeMap[$answers[0]])) {
    $purpose = $purposeMap[$answers[0]];
    // escape
    $purposeEsc = addslashes($purpose);
    $conds[] = "kebutuhan_pengguna = '$purposeEsc'";
}

// budget
if (isset($answers[1]) && isset($budgetMap[$answers[1]])) {
    $b = $budgetMap[$answers[1]];
    if (isset($b['min'])) $conds[] = "harga >= " . floatval($b['min']);
    if (isset($b['max'])) $conds[] = "harga <= " . floatval($b['max']);
}

// gpu need
if (isset($answers[3]) && isset($gpuMap[$answers[3]])) {
    $g = $gpuMap[$answers[3]];
    if ($g === 'none' || $g === 'light') {
        // prefer integrated/low-power GPUs
        $conds[] = "(vga LIKE 'Intel%' OR vga LIKE '%Integrated%' OR vga LIKE '%Iris%' OR vga LIKE '%UHD%' OR vga LIKE 'Integrated Apple%' OR vga = '' OR vga IS NULL)";
    } elseif ($g === 'medium') {
        // allow discrete mid-range GPUs and stronger integrated
        $conds[] = "(vga LIKE '%MX%' OR vga LIKE '%RTX%' OR vga LIKE '%RX%' OR vga LIKE '%NVIDIA%' OR vga LIKE '%AMD%')";
    } else {
        // heavy -> prioritize RTX / high-end
        $conds[] = "(vga LIKE '%RTX%' OR vga LIKE '%RX%' OR vga LIKE '%NVIDIA%')";
    }
}

// screen size
if (isset($answers[4]) && isset($screenMap[$answers[4]])) {
    $s = $screenMap[$answers[4]];
    if (isset($s['min'])) $conds[] = "ukuran_layar >= " . floatval($s['min']);
    if (isset($s['max'])) $conds[] = "ukuran_layar <= " . floatval($s['max']);
}

// connect to DB
require_once __DIR__ . '/helper/conn.php';

$sql = "SELECT id_laptop, nama_produk, harga, kebutuhan_pengguna, prosessor, ram, penyimpanan, vga, panel_layar, ukuran_layar, link_resmi, gambar FROM laptop";
if (count($conds) > 0) {
    $sql .= ' WHERE ' . implode(' AND ', $conds);
}
// prefer exact purpose matches first if provided
if (isset($purpose)) {
    $pEsc = addslashes($purpose);
    $sql .= " ORDER BY (kebutuhan_pengguna = '$pEsc') DESC, harga ASC";
} else {
    $sql .= " ORDER BY harga ASC";
}
$sql .= " LIMIT 5";

try {
    $result = $conn->query($sql);
    $out = [];
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $out[] = $row;
        }
    }

    // Fallback logic: If the specific query yields less than 3 results, run a broader one.
    if (count($out) < 3 && isset($purpose)) {
        $fallbackSql = "SELECT id_laptop, nama_produk, harga, kebutuhan_pengguna, prosessor, ram, penyimpanan, vga, panel_layar, ukuran_layar, link_resmi, gambar FROM laptop WHERE kebutuhan_pengguna = ? ORDER BY harga ASC LIMIT 3";
        $stmt = $conn->prepare($fallbackSql);
        if ($stmt) {
            $stmt->bind_param("s", $purpose);
            $stmt->execute();
            $fallbackResult = $stmt->get_result();
            
            $out = []; // Reset array to use fallback results exclusively
            if ($fallbackResult) {
                while ($row = $fallbackResult->fetch_assoc()) {
                    $out[] = $row;
                }
            }
            $stmt->close();
        }
    }

    // Final processing for all items in the output array
    foreach ($out as &$row) {
        if (isset($row['harga'])) {
            $row['harga'] = floatval($row['harga']);
        }
        // Dynamically create the image name from the product name, as the 'gambar' column is inconsistent.
        if (isset($row['nama_produk'])) {
            $row['gambar'] = $row['nama_produk'] . '.png';
        }
    }
    unset($row); // break the reference with the last element

    // Normalize and validate image path for each item so the frontend can directly use it.
    // Rules:
    // - If `gambar` is empty -> use placeholder
    // - If `gambar` is an absolute URL (http/https) -> leave as-is
    // - If `gambar` contains no path separator -> prefix with `img/laptop/`
    // - If resulting local file does not exist -> use placeholder
    foreach ($out as &$r) {
        $rawImg = '';
        if (isset($r['gambar']) && strlen(trim($r['gambar'])) > 0) {
            $rawImg = trim($r['gambar']);
        } elseif (isset($r['img']) && strlen(trim($r['img'])) > 0) {
            $rawImg = trim($r['img']);
        }

        if ($rawImg === '') {
            $r['gambar'] = 'img/placeholder.png';
            continue;
        }

        // absolute URL -> keep
        if (preg_match('#^https?://#i', $rawImg)) {
            $r['gambar'] = $rawImg;
            continue;
        }

        // if it already looks like a path (contains /) or already contains 'img/' prefix, use as-is
        if (strpos($rawImg, '/') !== false || stripos($rawImg, 'img/') !== false) {
            $candidate = $rawImg;
        } else {
            // simple filename -> assume img/laptop/
            $candidate = 'img/laptop/' . $rawImg;
        }

        // validate local file existence for non-http paths
        if (!preg_match('#^https?://#i', $candidate)) {
            $fsPath = __DIR__ . '/' . ltrim($candidate, '/');
            if (file_exists($fsPath)) {
                $r['gambar'] = $candidate;
            } else {
                $r['gambar'] = 'img/placeholder.png';
            }
        } else {
            $r['gambar'] = $candidate;
        }
    }
    unset($r);

} catch (Exception $e) {
    // In case of a database error, return an empty array
    $out = ['error' => $e->getMessage()];
}

echo json_encode($out, JSON_UNESCAPED_UNICODE);


// close connection
if (isset($conn) && $conn) $conn->close();

?>