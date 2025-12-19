
;;Usar quarto
(use-package quarto-mode
  :ensure t
  :mode (("\\.Rmd" . poly-quarto-mode)
         ("\\.qmd" . poly-quarto-mode))
  :config
  (setq quarto-render-kasten t)) ; Ayuda con la integración de bloques
(setq markdown-enable-math t) ; Activa el resaltado de fórmulas $...$
(add-hook 'markdown-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("\\\\[a-zA-Z]+" . font-lock-keyword-face)))))


(add-to-list 'display-buffer-alist
             '("\\*quarto-preview\\*"
               (display-buffer-no-window)
               (allow-no-window . t)))
(with-eval-after-load 'poly-quarto-mode
  (define-key poly-quarto-mode-map (kbd "C-c C-p") 'quarto-preview))

(provide 'quarto)
