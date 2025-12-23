;; ;; ---------------------------------------------------------
;; ;; 1. Markdown Mode (Base)
;; ;; Configuramos esto PRIMERO para evitar errores de variables vacías
;; ;; ---------------------------------------------------------
;; (use-package markdown-mode
;;   :ensure t
;;   :mode ("\\.md\\'" . gfm-mode)
;;   :init
;;   (setq markdown-command "multimarkdown")
;;   (setq markdown-enable-math t)
;;   :config
;;   ;; Esta variable SOLO existe después de cargar markdown-mode
;;   (add-to-list 'markdown-code-lang-modes '("yaml" . yaml-mode))
  
;;   ;; Hook visual (opcional)
;;   (add-hook 'markdown-mode-hook
;;             (lambda ()
;;               (font-lock-add-keywords nil
;;                                       '(("\\\\[a-zA-Z]+" . font-lock-keyworpd-face))))))

;; ;; ---------------------------------------------------------
;; ;; 2. Quarto Mode (Derivado)
;; ;; ---------------------------------------------------------
;; (use-package quarto-mode
;;   :ensure t
;;   :after markdown-mode ;; <--- IMPORTANTE: Espera a que Markdown exista
;;   :mode (("\\.Rmd" . poly-quarto-mode)
;;          ("\\.qmd" . poly-quarto-mode))
;;   :config
;;   ;(setq quarto-preview-args '("--no-browser"))
;;   (setq quarto-render-kasten t)

;;   ;; CORRECCIÓN DEL MAPA DE TECLAS:
;;   ;; Aseguramos que los modos estén cargados antes de tocar sus mapas
;; ;  (require 'markdown-mode)
;; ;  (require 'poly-quarto-mode) 

;;   ;; Configuración de Preview
;;   ;; (define-key poly-quarto-mode-map (kbd "C-c C-p") #'quarto-preview)
  
;;   (add-to-list 'display-buffer-alist
;;                '("\\*quarto-preview\\*"
;;                  (display-buffer-no-window)
;;                  (allow-no-window . t))))




;; ;; Activar números de línea
;; (use-package display-line-numbers
;;   :ensure nil ;; Viene integrado en Emacs, no necesita descarga
;;   :hook ((prog-mode . display-line-numbers-mode)   ;; En programación
;;          (yaml-mode . display-line-numbers-mode)   ;; En archivos YAML
;;          (quarto-mode . display-line-numbers-mode) ;; En Quarto
;;          (markdown-mode . display-line-numbers-mode)))

;; (with-eval-after-load 'polymode
;;   (setq-default polymode-eval-region-function 'python-shell-send-region))

;; (setq markdown-command "pandoc")


(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "pandoc") ;; Evita el error multimarkdown
  (setq markdown-enable-math t))

(use-package quarto-mode
  :ensure t
  :after markdown-mode
  :mode (("\\.qmd\\'" . poly-quarto-mode))
  :config
  (setq quarto-render-kasten t))

;; ;; Esto vincula Python con Polymode correctamente
;; (with-eval-after-load 'polymode
;;   (setq-default polymode-eval-region-function 'python-shell-send-region))


;; 1. Configuración para Python (Solo se activa en bloques Python)
(add-hook 'python-mode-hook
          (lambda () 
            (setq-local polymode-eval-region-function 'python-shell-send-region)))

;; 2. Configuración para R (Solo se activa en bloques R con ESS)
(add-hook 'ess-r-mode-hook
          (lambda () 
            (setq-local polymode-eval-region-function 'ess-eval-region)))




;; Guardar y renderizar el preview

(defun mi/quarto-save-and-render ()
  "Guarda el buffer actual y renderiza el documento Quarto."
  (interactive)
  (save-buffer)
  (quarto-preview)
  )
;; Asignar a F5 en los modos de Quarto
(with-eval-after-load 'quarto-mode
  (define-key poly-quarto-mode-map (kbd "<f5>") 'mi/quarto-save-and-render))

(with-eval-after-load 'poly-quarto-mode
  (define-key poly-quarto-mode-map (kbd "<f5>") 'mi/quarto-save-and-render))


(provide 'init-quarto)
