

(use-package python
  :ensure t
  :bind (:map python-ts-mode-map
              ("<f5>" . recompile)
              ("<f6>" . eglot-format))
  :hook ((python-ts-mode . eglot-ensure)
         (python-ts-mode . company-mode))
  :mode (("\\.py\\'" . python-ts-mode)))

;; (use-package python
;;   :hook (python-mode . lsp-deferred)) ;; <--- Esta es la línea clave

;; 1. Definir las fuentes de descarga
(setq treesit-language-source-alist
   '((python "https://github.com/tree-sitter/tree-sitter-python")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")  ;; Útil para Cargo.toml
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (bash "https://github.com/tree-sitter/tree-sitter-bash")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")))

;; 2. Función para instalarlas si faltan
(defun instalar-gramaticas-faltantes ()
  "Instala gramáticas de Tree-sitter listadas que no estén ya instaladas."
  (interactive)
  (dolist (grammar treesit-language-source-alist)
    (unless (treesit-language-available-p (car grammar))
      (treesit-install-language-grammar (car grammar)))))

(provide 'init-python)

