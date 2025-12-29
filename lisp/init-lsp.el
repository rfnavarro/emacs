
(use-package eglot
  :ensure t
  :demand t)
  ;; :hook (python-mode . eglot-ensure) ; Esto fuerza la instalación/carga en Python
  ;; :bind (:map eglot-mode-map
  ;;             ("C-c d" . eldoc)
  ;;             ("C-c a" . eglot-code-actions)
  ;;             ("C-c f" . flymake-show-buffer-diagnostics)
  ;;             ("C-c r" . eglot-rename)))


;;(desktop-save-mode 1)

(provide 'init-lsp)
