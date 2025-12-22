;; ---------------------------------------------------------
;; 1. Markdown Mode (Base)
;; Configuramos esto PRIMERO para evitar errores de variables vacías
;; ---------------------------------------------------------
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "multimarkdown")
  (setq markdown-enable-math t)
  :config
  ;; Esta variable SOLO existe después de cargar markdown-mode
  (add-to-list 'markdown-code-lang-modes '("yaml" . yaml-mode))
  
  ;; Hook visual (opcional)
  (add-hook 'markdown-mode-hook
            (lambda ()
              (font-lock-add-keywords nil
                                      '(("\\\\[a-zA-Z]+" . font-lock-keyworpd-face))))))

;; ---------------------------------------------------------
;; 2. Quarto Mode (Derivado)
;; ---------------------------------------------------------
(use-package quarto-mode
  :ensure t
  :after markdown-mode ;; <--- IMPORTANTE: Espera a que Markdown exista
  :mode (("\\.Rmd" . poly-quarto-mode)
         ("\\.qmd" . poly-quarto-mode))
  :config
  ;(setq quarto-preview-args '("--no-browser"))
  (setq quarto-render-kasten t)

  ;; CORRECCIÓN DEL MAPA DE TECLAS:
  ;; Aseguramos que los modos estén cargados antes de tocar sus mapas
;  (require 'markdown-mode)
;  (require 'poly-quarto-mode) 

  ;; Configuración de Preview
  ;; (define-key poly-quarto-mode-map (kbd "C-c C-p") #'quarto-preview)
  
  (add-to-list 'display-buffer-alist
               '("\\*quarto-preview\\*"
                 (display-buffer-no-window)
                 (allow-no-window . t))))




;; Activar números de línea
(use-package display-line-numbers
  :ensure nil ;; Viene integrado en Emacs, no necesita descarga
  :hook ((prog-mode . display-line-numbers-mode)   ;; En programación
         (yaml-mode . display-line-numbers-mode)   ;; En archivos YAML
         (quarto-mode . display-line-numbers-mode) ;; En Quarto
         (markdown-mode . display-line-numbers-mode)))

(provide 'init-quarto)
