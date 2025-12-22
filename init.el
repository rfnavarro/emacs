
;;; summary

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;;; Set up the package manager
(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;;; Purcell shell-conda solution
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

;nn; Emacs Version
(when (< emacs-major-version 29)
  (unless (package-installed-p 'use-package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))


;;; emadrid
;; Bootstrap
;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(eval-when-compile
  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)))


;; ;;;emadrid
;; ;; Debug and Wanings
;; (setq debug-on-error t)
;; (defvar warning-minimum-level)
;; (setq warning-minimum-level :error)




;; creo que aqui se configura que no se cambie de buffer en automatico
(add-to-list 'display-buffer-alist
             '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
               (display-buffer-no-window)
               (allow-no-window . t)))


;; Protesislaos config & other
(require 'init-protesislaous)
(require 'init-yasnippet)

;; IDE
(require 'init-r)
(require 'init-elpy)
(require 'init-quarto)
(require 'init-yaml)

;; Version Control
(require 'init-magit)

;;me
(require 'init-me)

;; Envs
(require 'init-conda)

;; Visor
(require 'init-pdf)







