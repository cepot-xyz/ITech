// Quiz engine: multi-step quiz per HTML, store answers to localStorage, show result page summary
document.addEventListener('DOMContentLoaded', async function() {
    // feather icons guard
    if (window.feather && typeof window.feather.replace === 'function') {
        feather.replace();
    }

    // Question datasets: prefer server-provided `window.questionBank` if available (injected by PHP),
    // otherwise fall back to embedded example questions.
    let questionBank;
    try {
        if (typeof window !== 'undefined' && window.questionBank && window.questionBank.laptop) {
            questionBank = window.questionBank;
        } else {
            questionBank = {
                laptop: [
                    { q: 'Apa tujuan utama penggunaan laptop Anda?', opts: ['Pekerjaan kantor', 'Desain / editing', 'Gaming', 'Kuliah / sekolah'] },
                    { q: 'Berapa kisaran budget Anda untuk laptop?', opts: ['< Rp5 juta', '5-10 juta', '10-20 juta', '>20 juta'] },
                    { q: 'Seberapa penting daya tahan baterai?', opts: ['Tidak penting', 'Cukup penting', 'Penting', 'Sangat penting'] },
                    { q: 'Apakah Anda butuh performa GPU untuk rendering/gaming?', opts: ['Tidak', 'Ringan', 'Sedang', 'Berat'] },
                    { q: 'Ukuran layar yang diinginkan?', opts: ['13"', '14"', '15-16"', '17"+'] }
                ],
                computer: [
                    { q: 'Apa budget yang Anda siapkan untuk komputer ini?', opts: ['< Rp5 juta', '5-10 juta', '10-20 juta', '>20 juta'] },
                    { q: 'Untuk apa utama komputer ini?', opts: ['Office / browsing', 'Desain / editing', 'Gaming', 'Server / workstation'] },
                    { q: 'Seberapa penting upgradeability (RAM / GPU)?', opts: ['Tidak penting', 'Mungkin nanti', 'Penting', 'Sangat penting'] },
                    { q: 'Preferensi GPU?', opts: ['Integrated', 'Entry-level', 'Mid-range', 'High-end'] },
                    { q: 'Jenis penyimpanan yang diinginkan?', opts: ['HDD', 'SSD', 'SSD + HDD', 'NVMe SSD'] ,},
                    { q: 'Apakah butuh casing kecil (mini-ITX)?', opts: ['Tidak', 'Mungkin', 'Iya'] },
                    { q: 'Perlukah garansi / after-sales lokal?', opts: ['Tidak penting', 'Diutamakan'] }
                ]
            };
        }
    } catch (e) {
        // fallback to embedded defaults
        questionBank = {
            laptop: [
                { q: 'Apa tujuan utama penggunaan laptop Anda?', opts: ['Pekerjaan kantor', 'Desain / editing', 'Gaming', 'Kuliah / sekolah'] },
                { q: 'Berapa kisaran budget Anda untuk laptop?', opts: ['< Rp5 juta', '5-10 juta', '10-20 juta', '>20 juta'] },
                { q: 'Seberapa penting daya tahan baterai?', opts: ['Tidak penting', 'Cukup penting', 'Penting', 'Sangat penting'] },
                { q: 'Apakah Anda butuh performa GPU untuk rendering/gaming?', opts: ['Tidak', 'Ringan', 'Sedang', 'Berat'] },
                { q: 'Ukuran layar yang diinginkan?', opts: ['13"', '14"', '15-16"', '17"+'] }
            ],
            computer: [
                { q: 'Apa budget yang Anda siapkan untuk komputer ini?', opts: ['< Rp5 juta', '5-10 juta', '10-20 juta', '>20 juta'] },
                { q: 'Untuk apa utama komputer ini?', opts: ['Office / browsing', 'Desain / editing', 'Gaming', 'Server / workstation'] },
                { q: 'Seberapa penting upgradeability (RAM / GPU)?', opts: ['Tidak penting', 'Mungkin nanti', 'Penting', 'Sangat penting'] },
                { q: 'Preferensi GPU?', opts: ['Integrated', 'Entry-level', 'Mid-range', 'High-end'] },
                { q: 'Jenis penyimpanan yang diinginkan?', opts: ['HDD', 'SSD', 'SSD + HDD', 'NVMe SSD'] ,},
                { q: 'Apakah butuh casing kecil (mini-ITX)?', opts: ['Tidak', 'Mungkin', 'Iya'] },
                { q: 'Perlukah garansi / after-sales lokal?', opts: ['Tidak penting', 'Diutamakan'] }
            ]
        };
    }

    const quizMain = document.getElementById('quizMain');
    if (!quizMain) return; // not on a quiz page

    const quizType = quizMain.dataset.quiz || 'laptop';
    // allow overriding questions via external JSON file: data/<quizType>-questions.json
    let questions = questionBank[quizType] || [];
    try {
        const resp = await fetch(`data/${quizType}-questions.json`, { cache: 'no-store' });
        if (resp.ok) {
            const external = await resp.json();
            if (Array.isArray(external) && external.length) {
                // map external structure to internal { q, opts }
                questions = external.map((it) => ({ q: it.text || it.q || '', opts: it.options || it.opts || [] }));
            }
        }
    } catch (err) {
        // fail silently and keep using bundled or injected questionBank
        console.warn('Could not load external questions for', quizType, err);
    }
    const total = questions.length;

    const progressText = document.getElementById('progressText');
    const progressBar = document.getElementById('progressBar');
    const questionContainer = document.getElementById('questionContainer');
    const backBtn = document.getElementById('backBtn');
    const nextBtn = document.getElementById('nextBtn');

    // create a polite live region for announcements (saves, errors)
    let ariaLive = document.getElementById('quizAriaLive');
    if (!ariaLive) {
        ariaLive = document.createElement('div');
        ariaLive.id = 'quizAriaLive';
        ariaLive.className = 'sr-only';
        ariaLive.setAttribute('aria-live', 'polite');
        document.body.appendChild(ariaLive);
    }

    let current = 0;
    const answers = new Array(total).fill(null);

    function updateProgress() {
        if (progressText) {
            const pct = Math.round(((current+1) / total) * 100);
            progressText.textContent = `Pertanyaan ${current+1} dari ${total} — ${pct}%`;
        }
        if (progressBar) {
            const pct = Math.round(((current+1) / total) * 100);
            progressBar.style.width = pct + '%';
            // ARIA for progressbar
            progressBar.setAttribute('role', 'progressbar');
            progressBar.setAttribute('aria-valuemin', '0');
            progressBar.setAttribute('aria-valuemax', '100');
            progressBar.setAttribute('aria-valuenow', String(pct));
        }
    }

    function renderQuestion() {
        const item = questions[current];
        if (!item) return;
        const optsHtml = item.opts.map((opt, i) => {
            const sel = answers[current] === i ? 'selected' : '';
            return `
                <button data-opt="${i}" class="quiz-answer w-full text-left ${sel} rounded-lg border hover:border-blue-500 transition-all duration-300 glow-effect" type="button" role="button" aria-pressed="${answers[current] === i}">
                    <div class="flex items-center">
                        <span>${opt}</span>
                    </div>
                </button>
            `;
        }).join('\n');

        questionContainer.innerHTML = `
            <h2 class="text-2xl font-semibold mb-6">${item.q}</h2>
            <div class="answer-options space-y-4">${optsHtml}</div>
        `;

        // attach handlers to newly created buttons
        const createdBtns = questionContainer.querySelectorAll('.quiz-answer');
        createdBtns.forEach((btn, idxBtn) => {
            // make keyboard-friendly
            btn.setAttribute('tabindex', '0');
            btn.addEventListener('click', function (e) {
                const idx = parseInt(this.dataset.opt, 10);
                answers[current] = idx;
                // visual update
                createdBtns.forEach((s) => { s.classList.remove('selected'); s.setAttribute('aria-pressed', 'false'); });
                this.classList.add('selected');
                this.setAttribute('aria-pressed', 'true');
                // announce save
                try {
                    const key = `quiz_answers_${quizType}`;
                    // Save partial progress immediately
                    localStorage.setItem(key, JSON.stringify({ quiz: quizType, answers }));
                    localStorage.setItem('last_quiz', quizType);
                    ariaLive.textContent = 'Jawaban disimpan.';
                } catch (err) {
                    console.warn('LocalStorage error saving answer', err);
                    ariaLive.textContent = 'Gagal menyimpan jawaban.';
                }
            });
            // keyboard support
            btn.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    btn.click();
                }
            });
        });

        // focus the first button for quick keyboard navigation
        const firstBtn = questionContainer.querySelector('.quiz-answer');
        if (firstBtn) firstBtn.focus();

        updateProgress();
    }

    // initial render
    renderQuestion();

    if (backBtn) backBtn.addEventListener('click', function() {
        if (current === 0) {
            window.location.href = 'index.html';
            return;
        }
        current--;
        renderQuestion();
    });

    if (nextBtn) nextBtn.addEventListener('click', function() {
        // require selection before moving on
        if (answers[current] === null) {
            // simple feedback
            const prev = nextBtn.textContent;
            nextBtn.textContent = 'Pilih jawaban dulu';
            nextBtn.setAttribute('aria-invalid', 'true');
            setTimeout(() => { nextBtn.textContent = prev; nextBtn.removeAttribute('aria-invalid'); }, 1200);
            return;
        }

        if (current < total - 1) {
            current++;
            renderQuestion();
        } else {
            // finish quiz -> save answers and redirect to result
            const key = `quiz_answers_${quizType}`;
            try {
                localStorage.setItem(key, JSON.stringify({ quiz: quizType, answers }));
                localStorage.setItem('last_quiz', quizType);
            } catch (err) {
                console.warn('LocalStorage error on finish', err);
                // inform user and continue
                alert('Terjadi kesalahan menyimpan hasil. Coba lagi atau periksa pengaturan browser Anda.');
            }
            window.location.href = 'result.php';
        }
    });
});

/* js-kuis-end */

// Simple helper navigation
const navigateTo = (page) => { window.location.href = page; };

// If on result page, ask backend for recommended laptops (based on saved answers) and render them
(function() {
    // wait for DOM ready in case script.js loaded early
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', run);
    } else run();

    function run() {
        const productContainer = document.getElementById('productContainer');
        if (!productContainer) return; // not on result page

        const last = localStorage.getItem('last_quiz');
        if (!last) {
            productContainer.innerHTML = `<div class="col-span-1 text-gray-300">Tidak ada data kuis. Silakan ulangi kuis untuk mendapatkan rekomendasi.</div>`;
            return;
        }
        const key = `quiz_answers_${last}`;
        const raw = localStorage.getItem(key);
        if (!raw) {
            productContainer.innerHTML = `<div class="col-span-1 text-gray-300">Tidak ada jawaban tersimpan untuk kuis ini.</div>`;
            return;
        }

        let payload;
        try {
            payload = JSON.parse(raw);
        } catch (e) {
            productContainer.innerHTML = `<div class="col-span-1 text-red-400">Gagal membaca jawaban kuis.</div>`;
            return;
        }

        const endpoint = last === 'computer' ? 'recommend_computers.php' : 'recommend_laptops.php';

        fetch(endpoint, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ quiz: last, answers: payload.answers })
        }).then(r => r.json()).then(data => {
            if (!Array.isArray(data) || data.length === 0) {
                // fallback to local JSON products, now including image
                return fetch('data/laptop-products.json').then(r => r.json()).then(j => (j.products || []).slice(0,3).map(p => ({ name: p.name, price: p.price, desc: p.description, url: p.url, gambar: p.img })) );
            }
            return data;
        }).then(list => {
            productContainer.innerHTML = '';
            if (!list || list.length === 0) {
                productContainer.innerHTML = `<div class="col-span-1 text-gray-300">Tidak ada rekomendasi yang cocok.</div>`;
                return;
            }
            list.slice(0, 5).forEach(item => {
                const price = typeof item.harga !== 'undefined' ? Number(item.harga) : (item.price || 0);
                const desc = item.prosessor ? `${item.prosessor} • ${item.ram} • ${item.vga || ''}` : (item.desc || '');
                const card = document.createElement('div');
                card.className = 'bg-gray-800 rounded-xl p-6 border border-gray-700 hover:border-blue-500 transition-all duration-300 hover:shadow-lg hover:shadow-blue-900/20';
                card.innerHTML = `
                    <div class="flex flex-col h-full">
                        <div class="aspect-w-16 aspect-h-9 mb-6 overflow-hidden rounded-lg bg-gray-700">
                            <img src="img/laptop/${escapeAttr(item.gambar || 'placeholder.jpg')}" alt="Gambar produk ${escapeAttr(item.nama_produk || item.name)}" class="w-full h-full object-cover">
                        </div>
                        <h3 class="text-xl font-semibold mb-2">${escapeHtml(item.nama_produk || item.name)}</h3>
                        <div class="text-sm text-gray-400 mb-4">${escapeHtml(item.kebutuhan_pengguna || '')}</div>
                        <p class="text-gray-400 mb-6">${escapeHtml(desc)}</p>
                        <div class="mt-auto flex gap-3">
                            <a href="${escapeAttr(item.link_resmi || item.url || '#')}" target="_blank" class="flex-1 text-center bg-gradient-to-r from-blue-600 to-blue-800 text-white font-medium py-3 px-6 rounded-lg">Lihat Detail</a>
                            <div class="px-4 py-3 rounded-lg bg-gray-900 text-white">${formatRupiah(price)}</div>
                        </div>
                    </div>
                `;
                productContainer.appendChild(card);
            });
            try { if (window.feather && typeof window.feather.replace === 'function') window.feather.replace(); } catch (e) {}
        }).catch(err => {
            productContainer.innerHTML = `<div class="col-span-1 text-red-400">Terjadi kesalahan saat memuat rekomendasi.</div>`;
            console.error('Rekomendasi error', err);
        });
    }

    function formatRupiah(n) { if (!n) return '-'; return 'Rp ' + n.toLocaleString('id-ID'); }
    function escapeHtml(s) { if (!s) return ''; return String(s).replace(/[&"'<>]/g, function (m) { return ({'&':'&amp;','"':'&quot;','\'':'&#39;','<':'&lt;','>':'&gt;'})[m]; }); }
    function escapeAttr(s) { return escapeHtml(s).replace(/"/g, '%22'); }

})();