class CustomNavbar extends HTMLElement {
    connectedCallback() {
        this.attachShadow({ mode: 'open' });
        this.shadowRoot.innerHTML = `
            <style>
                :host { display: block; }
                header {
                    padding: 2rem 1rem;
                    text-align: center;
                    color: #fff;
                    position: relative;
                    z-index: 101;
                    font-family: 'Montserrat', sans-serif;
                }

                .container {
                    max-width: 1100px;
                    margin: 0 auto;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    gap: 0.5rem;
                }

                .brand {
                    display: flex;
                    align-items: center;
                    gap: 0.75rem;
                }

                .logo-img {
                    width: 64px;
                    height: 64px;
                    object-fit: contain;
                }

                .title {
                    font-size: 2.25rem;
                    font-weight: 700;
                    margin: 0;
                    color: #ffffff; /* make ITech title white */
                }

                .subtitle {
                    color: #d1d5db;
                    font-size: 1rem;
                    max-width: 56rem;
                    margin-top: 0.25rem;
                }

                @media (min-width: 640px) {
                    .title { font-size: 3rem; }
                    .subtitle { font-size: 1.125rem; }
                }
            </style>

            <header>
                <div class="container">
                    <div class="brand">
                        <img src="logo.png" alt="ITech Logo" class="logo-img">
                        <h1 class="title">ITech</h1>
                    </div>
                    <p class="subtitle">Dapatkan rekomendasi perangkat yang optimal untuk kerja, kreativitas, dan hiburan — dipersonalisasi berdasarkan kebutuhan, anggaran, dan preferensi Anda.</p>
                </div>
            </header>

            <warning-panel id="warningPanel" aria-hidden="true"></warning-panel>
        `;

        const headerEl = this.shadowRoot.querySelector('header');
        const panelEl = this.shadowRoot.querySelector('warning-panel');

        if (!headerEl) return;

        headerEl.setAttribute('tabindex', '0');
        headerEl.style.cursor = 'pointer';

        const isIndexPath = () => {
            try {
                const loc = window.location.pathname;
                return loc.endsWith('index.html') || loc === '/' || loc === '';
            } catch (e) {
                return false;
            }
        };

        const showDialog = () => {
            if (isIndexPath()) return; // already on index
            if (panelEl && typeof panelEl.show === 'function') panelEl.show();
        };

        const hideDialog = () => {
            if (panelEl && typeof panelEl.hide === 'function') panelEl.hide();
        };

        headerEl.addEventListener('click', (e) => {
            e.preventDefault();
            showDialog();
        });

        headerEl.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                showDialog();
            }
        });

        // Listen to panel events
        if (panelEl) {
            panelEl.addEventListener('confirm', () => {
                try { window.location.href = 'index.html'; } catch (ex) { window.location.assign('index.html'); }
            });

            panelEl.addEventListener('cancel', () => {
                hideDialog();
            });
        }
    }
}

customElements.define('custom-navbar', CustomNavbar);
