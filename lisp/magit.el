
;; Magit setup

(use-package delight
 :ensure t)


(use-package magit
 :ensure t)

(use-package git-gutter
 :ensure t
 :defer 0.3
 :delight
 :init (global-git-gutter-mode))

(use-package git-timemachine
 :ensure t
 :defer 1
:delight)

(provide 'magit)
