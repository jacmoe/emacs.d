;; smart-parens
(require 'smartparens-config)

;; Aggressive indent
;;(global-aggressive-indent-mode 1)
;;(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; Scss mode
(setq scss-compile-at-save nil)
(setq scss-sass-command "/usr/local/bin/sass")
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

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
;; better Projectile key bindings
(setq projectile-switch-project-action
      #'projectile-commander)

;; s in the commander window runs a shell
(def-projectile-commander-method ?s
  "Open a *shell* buffer for the project."
  (shell (get-buffer-create
          (format "*shell %s*"
                  (projectile-project-name)))))
;; c in the commander window runs compile
(def-projectile-commander-method ?c
  "Run `compile' in the project."
  (call-interactively #'compile))

;; backspace backs out of current project
(def-projectile-commander-method ?\C-?
  "Go back to project selection."
  (projectile-switch-project))

;; project dired instead of project find
(def-projectile-commander-method ?d
  "Open project root in dired."
  (projectile-dired))

;; f for git fetch
(def-projectile-commander-method ?F
  "Git fetch."
  (magit-status)
  (call-interactively #'magit-fetch-current))


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
(add-hook 'rust-mode-hook #'smartparens-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; PHP
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; turn on subword-mode for php mode and web mode
(add-hook 'php-mode-hook (lambda () (subword-mode 1)))
(add-hook 'web-mode-hook (lambda () (subword-mode 1)))

;; Enable PSR2 coding style
(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)

;; For flymake to function
(setq php-executable "/usr/local/bin/php")

;; Irony
;;(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Cmake IDE
;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/rtags/")
;(require 'rtags) ;; optional, must have rtags installed
;(cmake-ide-setup)

