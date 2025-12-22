
;; company-mode

(use-package company
  :ensure t
  :config
  ;; 1. Activar el modo globalmente (mejor que el hook en :config)
  (global-company-mode t)

  ;; 2. Configuraciones visuales y de comportamiento
  (setq company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-idle-delay 0.45
        company-minimum-prefix-length 2
        company-tooltip-limit 10
        company-show-quick-access 'left)) ;; <--- Aquí está lo de los números M-1

(provide 'init-company)
