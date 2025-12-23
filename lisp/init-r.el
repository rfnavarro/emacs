
;;R config
;; Forma correcta para auto-instalar
(use-package ess
  :ensure t)

(provide 'init-r)

;; Asegura que el terminal baje automáticamente al recibir salida
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

;; Configuración específica para ESS (R)
(setq ess-scroll-to-bottom-on-output t)



;; Numeración en la consola de R (ESS)
(add-hook 'inferior-ess-r-mode-hook #'display-line-numbers-mode)

