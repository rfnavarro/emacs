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


(defun tws-insert-r-chunk (header) 
  "Insert an r-chunk in markdown mode. Necessary due to interactions between polymode and yas snippet" 
  (interactive "sHeader: ") 
  (insert (concat "```{r " header "}\n\n```")) 
  (forward-line -1))

(provide 'init-elpy)

