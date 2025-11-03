<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hasil Rekomendasi - ITech</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="components/warning-panel.js"></script>
    <script src="components/navbar.js"></script>
</head>
<body class="bg-gray-900 text-gray-100 font-montserrat min-h-screen">
    <custom-navbar></custom-navbar>

    <!-- Results Container Start -->
    <main class="py-12 px-4 sm:px-8">
        <div class="container mx-auto max-w-4xl">
            <!-- Result Header Start -->
            <div class="text-center mb-12">
                <h1 class="text-3xl sm:text-4xl font-bold mb-4">Rekomendasi Untuk Anda</h1>
                <p class="text-xl text-gray-400 max-w-2xl mx-auto">
                    Berdasarkan jawaban Anda, berikut rekomendasi terbaik untuk kebutuhan Anda
                </p>
            </div>
            <!-- Result Header End -->

            <!-- Result Summary Start -->
            <div id="resultSummary" class="bg-gray-800 rounded-xl p-6 md:p-8 border border-gray-700 shadow-lg mb-8">
                <h2 class="text-2xl font-semibold mb-4">Ringkasan Jawaban Anda</h2>
                <div id="summaryContent" class="text-gray-300"></div>
            </div>
            <!-- Result Summary End -->

            <!-- Product Cards (dynamic) -->
            <div id="productContainer" class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <!-- rekomendasi produk akan di-render di sini oleh script.js -->
            </div>
            <!-- Product Cards End -->

            <!-- CTA Section Start -->
            <div class="mt-16 text-center">
                <h2 class="text-2xl font-semibold mb-4">Tidak menemukan yang sesuai?</h2>
                <p class="text-gray-400 mb-6 max-w-2xl mx-auto">Coba ulangi kuis dengan jawaban berbeda atau hubungi tim spesialis kami untuk konsultasi lebih lanjut</p>
                <div class="flex flex-col sm:flex-row justify-center gap-4">
                    <a href="index.html" class="px-6 py-3 bg-gray-800 hover:bg-gray-700 text-white rounded-lg border border-gray-700 transition-all duration-300">
                        Ulangi Kuis
                    </a>
                    <a href="https://wa.me" class="px-6 py-3 bg-blue-600 hover:bg-blue-500 text-white rounded-lg transition-all duration-300 glow-effect">
                        Hubungi Spesialis
                    </a>
                </div>
            </div>
            <!-- CTA Section End -->
        </div>
    </main>
    <!-- Results Container End -->

    <script src="script.js"></script>
    <script>
        feather.replace();
    </script>
    <script>
        // render simple summary from localStorage
        (function() {
            const summary = document.getElementById('summaryContent');
            if (!summary) return;
            const last = localStorage.getItem('last_quiz');
            if (!last) {
                summary.innerHTML = `
                    <div class="text-center py-8">
                        <p class="text-gray-300 mb-4">Tidak ada data kuis ditemukan.</p>
                        <a href="index.html" class="px-6 py-3 bg-blue-600 text-white rounded-lg">Kembali ke Beranda</a>
                    </div>
                `;
                return;
            }
            const key = `quiz_answers_${last}`;
            const raw = localStorage.getItem(key);
            if (!raw) {
                summary.innerHTML = `
                    <div class="text-center py-8">
                        <p class="text-gray-300 mb-4">Tidak ada jawaban tersimpan untuk kuis ini.</p>
                        <a href="kuis ${last}.html" class="px-6 py-3 bg-blue-600 text-white rounded-lg">Mulai Kuis</a>
                    </div>
                `;
                return;
            }
            try {
                const data = JSON.parse(raw);
                const answers = data.answers || [];
                // If answers aren't complete, show CTA to resume or restart
                const answered = answers.filter(a => a !== null).length;
                if (answered < answers.length) {
                    summary.innerHTML = `
                        <div class="text-center py-8">
                            <p class="text-gray-300 mb-4">Sepertinya Anda belum menyelesaikan kuis. ${answered} dari ${answers.length} pertanyaan terjawab.</p>
                            <div class="flex justify-center gap-4">
                                <a href="kuis ${last}.html" class="px-6 py-3 bg-blue-600 text-white rounded-lg">Lanjutkan Kuis</a>
                                <a href="index.html" class="px-6 py-3 bg-transparent border border-gray-600 text-gray-200 rounded-lg">Kembali ke Beranda</a>
                            </div>
                        </div>
                    `;
                    return;
                }

                // We'll show each answer as a list item (index + value)
                const list = document.createElement('ul');
                list.className = 'space-y-2 text-gray-300';
                answers.forEach((a, i) => {
                    const li = document.createElement('li');
                    li.textContent = `Pertanyaan ${i+1}: Jawaban ${a === null ? '—' : a+1}`;
                    list.appendChild(li);
                });
                summary.appendChild(list);
            } catch (e) {
                summary.innerHTML = '<p class="text-red-400">Gagal membaca data jawaban.</p>';
            }
        })();
    </script>
</body>
</html>