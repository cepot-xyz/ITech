class WarningPanel extends HTMLElement {
    constructor() {
        super();
        this.attachShadow({ mode: 'open' });
    }

    connectedCallback() {
        this.shadowRoot.innerHTML = `
            <style>
                :host { display: block; }
                .modal-overlay {
                    position: fixed;
                    inset: 0;
                    background: rgba(0,0,0,0.35);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    z-index: 1000;
                    opacity: 0;
                    visibility: hidden;
                    backdrop-filter: blur(0px);
                    -webkit-backdrop-filter: blur(0px);
                    transition: opacity 350ms cubic-bezier(.16,1,.3,1), visibility 350ms linear, backdrop-filter 350ms cubic-bezier(.16,1,.3,1);
                }

                .modal-overlay.open {
                    opacity: 1;
                    visibility: visible;
                    backdrop-filter: blur(6px);
                    -webkit-backdrop-filter: blur(6px);
                }

                .modal {
                    background: linear-gradient(180deg,#071033,#0b1b3a);
                    color: #e6eef8;
                    padding: 1rem 1.1rem;
                    border-radius: 12px;
                    box-shadow: 0 24px 48px -12px rgba(2,6,23,0.6), 0 10px 18px -10px rgba(2,6,23,0.28);
                    max-width: 440px;
                    width: calc(100% - 48px);
                    transform: translateY(10px) scale(.98);
                    opacity: 0;
                    font-family: inherit;
                    text-align: center;
                    transition: transform 350ms cubic-bezier(.16,1,.3,1), opacity 350ms cubic-bezier(.16,1,.3,1);
                    display: flex;
                    gap: 0.75rem;
                    flex-direction: column;
                    align-items: center;
                }

                .modal.show {
                    transform: translateY(0) scale(1);
                    opacity: 1;
                }

                .modal .icon {
                    width: 56px;
                    height: 56px;
                    border-radius: 10px;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    background: rgba(255,255,255,0.06);
                    margin-bottom: 6px;
                }

                .modal .icon svg { width: 26px; height: 26px; }

                .modal .content {
                    margin: 0;
                    text-align: center;
                }

                .modal .message {
                    margin: 0;
                    color: #e6eef8;
                    font-size: 1.02rem;
                    line-height: 1.5rem;
                }

                .modal .actions {
                    margin-top: 0.9rem;
                    display: flex;
                    gap: 0.5rem;
                    justify-content: center;
                }

                .btn {
                    padding: 0.55rem 0.85rem;
                    border-radius: 8px;
                    border: none;
                    cursor: pointer;
                    font-weight: 600;
                    min-width: 88px;
                }

                .btn.cancel {
                    background: transparent;
                    color: #cbd5e1;
                    border: 1px solid rgba(255,255,255,0.08);
                }

                .btn.confirm {
                    background: linear-gradient(90deg,#163c90,#2764f3);
                    color: white;
                    box-shadow: 0 6px 18px rgba(23,76,188,0.18);
                }
            </style>

            <div class="modal-overlay" id="overlay" aria-hidden="true">
                <div class="modal" role="dialog" aria-modal="true">
                    <div class="icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path d="M12 2L22 20H2L12 2Z" fill="#FFFFFF"/>
                            <rect x="11" y="8" width="2" height="6" rx="1" fill="#071033"/>
                            <rect x="11" y="16" width="2" height="2" rx="1" fill="#071033"/>
                        </svg>
                    </div>
                    <div class="content">
                        <p class="message">Kembali ke Beranda? Progres kuis akan hilang</p>
                        <div class="actions">
                            <button class="btn cancel" id="cancelBtn" type="button">Batal</button>
                            <button class="btn confirm" id="confirmBtn" type="button">Konfirmasi</button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        this._overlay = this.shadowRoot.getElementById('overlay');
        this._modal = this.shadowRoot.querySelector('.modal');
        this._confirm = this.shadowRoot.getElementById('confirmBtn');
        this._cancel = this.shadowRoot.getElementById('cancelBtn');

        this._onConfirm = () => {
            this.hide();
            this.dispatchEvent(new CustomEvent('confirm', { bubbles: true, composed: true }));
        };

        this._onCancel = () => {
            this.hide();
            this.dispatchEvent(new CustomEvent('cancel', { bubbles: true, composed: true }));
        };

        this._escHandler = (e) => {
            if (e.key === 'Escape') this.hide();
        };

        this._confirm.addEventListener('click', this._onConfirm);
        this._cancel.addEventListener('click', this._onCancel);
    }

    disconnectedCallback() {
        if (this._confirm) this._confirm.removeEventListener('click', this._onConfirm);
        if (this._cancel) this._cancel.removeEventListener('click', this._onCancel);
        window.removeEventListener('keydown', this._escHandler);
    }

    show() {
        if (!this._overlay || !this._modal) return;
        this._overlay.classList.add('open');
        this._overlay.setAttribute('aria-hidden', 'false');
        requestAnimationFrame(() => this._modal.classList.add('show'));
        // focus cancel for safety
        this._cancel.focus();
        window.addEventListener('keydown', this._escHandler);
    }

    hide() {
        if (!this._overlay || !this._modal) return;
        this._modal.classList.remove('show');
        const tidy = () => {
            this._overlay.classList.remove('open');
            this._overlay.setAttribute('aria-hidden', 'true');
            window.removeEventListener('keydown', this._escHandler);
            this._overlay.removeEventListener('transitionend', tidy);
        };
        this._overlay.addEventListener('transitionend', tidy);
        setTimeout(tidy, 500);
    }
}

customElements.define('warning-panel', WarningPanel);
