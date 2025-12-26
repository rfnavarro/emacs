;; trasladado a init-elpy.el
;; elpy mode - autocompletado python
(use-package elpy
  :ensure t
  :init
  (setq elpy-rpc-backend "rpc") ; Fuerza a Elpy a NO usar jedi
  :config
  (elpy-enable)
  (add-hook 'python-mode-hook 'elpy-mode)
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--simple-prompt -i")
  (pyvenv-mode 1)
  (setq gud-pdb-command-name "python -m pdb "))


;; Configuración para Python
(add-hook 'python-mode-hook
          (lambda ()
            (hs-minor-mode 1)
            (outline-minor-mode 1)
            (setq-local outline-regexp "# ---")))


;; ;; Ignora líneas largas (E501) y falta de líneas en blanco (E302)
;; (setq elpy-flake8-options '("--ignore=E501"))


;; ;; --- Elpy ---
;; (use-package elpy
;;   :ensure t
;;   :init
;;  (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i --no-banner")
;; ;;        python-shell-interpreter-args "--simple-prompt -i --no-banner")
;;   :config
;;   (elpy-enable)

;;   ;; Debugger
;;   (setq gud-pdb-command-name "python -m pdb "))

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (hs-minor-mode 1)
;;             (outline-minor-mode 1)
;;             (setq-local outline-regexp "# ---")))


;; (use-package pyvenv
;;   :ensure t
;;   :config
;;   (pyvenv-mode 1))


 (provide 'init-elpy)

