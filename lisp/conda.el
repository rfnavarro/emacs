
(use-package conda
  :ensure t
  :config
  ;; 1. Dile dónde está Anaconda (ajusta si es necesario)
  (setq conda-anaconda-home "/opt/anaconda3")
  
  ;; 2. ESTA ES LA CLAVE: Integra conda con el shell de python
  (conda-env-autoactivate-mode 1)  
  ;; 3. Opcional: Que el shell de python use siempre el entorno activo
  (setq conda-env-autoactivate-mode t))

(provide 'conda)
