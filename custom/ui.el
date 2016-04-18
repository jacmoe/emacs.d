;; UI
(setq sml/theme 'powerline)
(sml/setup)

;; (setq default-frame-alist (append (list
;; 				   '(width  . 120)  ; Width set to 81 characters
;; 				   '(height . 40)) ; Height set to 60 lines
;; 				  default-frame-alist))


					;(load-theme 'zenburn t)
					;(load-theme 'atom-one-dark t)
					;(load-theme 'spacemacs-dark t)

(load-theme 'flatland t)

(menu-bar-mode -1)

(setq inhibit-startup-message t)

(setq-default cursor-type 'bar)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(set-face-attribute 'default nil :height 140 :family "Source Code Pro")
;(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.4)
(blink-cursor-mode 0)
(setq ring-bell-function 'ignore)
(setq
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)
