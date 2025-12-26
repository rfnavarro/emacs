;; evitar parpadeo de cursor
(blink-cursor-mode 0)

;; Autocompletar parentesis
(use-package electric
  :ensure nil
  :config
  (electric-pair-mode 1))


;; iluminar codigo igual en todas las lineas y reemplazarlo. Iluminiacion y edicion
(use-package iedit
  :ensure t
  :bind ("C-;" . iedit-mode)) ;; Asigna Control + punto y coma



(use-package ef-themes
  :ensure t
  :config
  (load-theme 'ef-night))


(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(let ((mono-spaced-font "Monospace")
      (proportionately-spaced-font "Sans"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 150)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))


;;Mostrar el path completo del archivo

(setq-default mode-line-buffer-identification
              (list 'buffer-file-name
                    (propertized-buffer-identification "%12f")
                    (propertized-buffer-identification "%12b")))



(provide 'init-me)






