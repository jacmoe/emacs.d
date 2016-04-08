;; Git
(require 'magit)
(eval-after-load 'magit
  (progn '(global-set-key (kbd "C-x g") 'magit-status)))

;; flx-ido completion system, recommended by Projectile
(require 'flx-ido)
(flx-ido-mode 1)
;; change it if you have a fast processor.
(setq flx-ido-threshhold 1000)

;; Project management
(require 'projectile)
(projectile-global-mode)

;; Snippets
;; https://github.com/capitaomorte/yasnippet
(require 'yasnippet)
(yas-load-directory '"~/.emacs.d/snippets")
(yas-global-mode 1)

;; Set path to rust src directory
(setq racer-rust-src-path "/home/jacmoe/rustc-beta/src/")

;; Set up configurations when you load rust-mode
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
