<?php
header('Content-Type: application/json; charset=utf-8');

// Database & Input Setup
require_once __DIR__ . '/helper/conn.php';
$input = json_decode(file_get_contents('php://input'), true);
if (!isset($input['answers']) || !is_array($input['answers'])) {
    echo json_encode(['error' => 'Invalid input']);
    exit;
}
$answers = $input['answers'];

// Load question logic from JSON
$questionsJson = file_get_contents(__DIR__ . '/data/computer-questions.json');
$questions = json_decode($questionsJson, true);
if (!$questions) {
    echo json_encode(['error' => 'Could not load question logic']);
    exit;
}

// --- Logic Processing ---
$conditions = [];
$params = [];
$param_types = '';
$scores = ['cpu_score' => 0, 'gpu_score' => 0, 'ram_score' => 0, 'aesthetic_score' => 0];

foreach ($answers as $q_idx => $ans_idx) {
    if ($ans_idx === null || !isset($questions[$q_idx])) continue;

    $question = $questions[$q_idx];
    $logic_type = $question['logic_type'] ?? 'DUMMY';
    $logic_data = $question['logic_data'] ?? [];

    if ($logic_type === 'DUMMY') continue;

    switch ($logic_type) {
        case 'BUDGET_FILTER':
            if (isset($logic_data['max_price'][$ans_idx])) {
                $conditions[] = 'p.harga <= ?';
                $params[] = $logic_data['max_price'][$ans_idx];
                $param_types .= 'd';
            }
            break;

        case 'COMPONENT_FILTER':
            if (isset($logic_data['values'][$ans_idx])) {
                $table = $logic_data['table'];
                $column = $logic_data['column'];
                $value = $logic_data['values'][$ans_idx];
                
                if ($value !== null) {
                    // This is a simplified approach. A real implementation would need more robust table/column mapping.
                    if ($table === 'processor') {
                         $conditions[] = 'proc.nama_produk LIKE ?';
                         $params[] = $value;
                         $param_types .= 's';
                    } else if ($table === 'vga') {
                         $conditions[] = 'v.chipset LIKE ?';
                         $params[] = $value;
                         $param_types .= 's';
                    }
                }
            }
            break;

        case 'SPECS_MATCH':
            if (isset($logic_data['min_value'][$ans_idx])) {
                $table = $logic_data['table'];
                $column = $logic_data['column'];
                $value = $logic_data['min_value'][$ans_idx];

                if ($table === 'ram') {
                    $conditions[] = 'r.kapasitas >= ?';
                    $params[] = $value;
                    $param_types .= 'i';
                }
            }
            break;

        case 'SPECS_WEIGHT':
            foreach ($logic_data as $spec => $weights) {
                if (isset($scores[$spec]) && isset($weights[$ans_idx])) {
                    $scores[$spec] += $weights[$ans_idx];
                }
            }
            break;
    }
}

// --- Database Query ---
// NOTE: This query assumes a `rekomendasi_pc` table that is pre-populated with valid builds.
// Since it's empty, this query will return no results. A real-world app would need a seeder for that table.
$sql = "
    SELECT 
        rec.id_rekomendasi, rec.nama_paket, rec.total_harga_paket as harga,
        proc.nama_produk as prosessor, 
        v.nama_produk as vga, 
        r.nama_produk as ram
    FROM rekomendasi_pc rec
    JOIN processor proc ON rec.id_processor = proc.id_processor
    JOIN vga v ON rec.id_vga = v.id_vga
    JOIN ram r ON rec.id_ram_1 = r.id_ram
";

if (!empty($conditions)) {
    $sql .= " WHERE " . implode(' AND ', $conditions);
}

// This is a simplified scoring model. A real one would be more complex.
$sql .= " ORDER BY (proc.score * ?) + (v.score * ?) + (r.score * ?) DESC, rec.total_harga_paket ASC LIMIT 5";
$params[] = $scores['cpu_score'];
$params[] = $scores['gpu_score'];
$params[] = $scores['ram_score'];
$param_types .= 'iii';


$stmt = $conn->prepare($sql);
if ($stmt) {
    if (!empty($param_types) && !empty($params)) {
        $stmt->bind_param($param_types, ...$params);
    }
    
    $stmt->execute();
    $result = $stmt->get_result();
    $output = [];
    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $row['harga'] = floatval($row['harga']);
            $output[] = $row;
        }
    }
    $stmt->close();
} else {
    $output = ['error' => 'Failed to prepare statement: ' . $conn->error];
}

$conn->close();

echo json_encode($output, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

?>