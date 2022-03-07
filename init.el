;;; init.el --- My Emacs configuration

;; Copyright (C) 2017 Jacob Moen

;; Author: Jacob Moen <jacmoe.dk@gmail.com>
;; Created: 01 January 2017
;; Homepage: https://github.com/angrybacon/.emacs.d

;; This program is free software. It comes without any warranty, to the extent
;; permitted by applicable law. You can redistribute it and/or modify it under the
;; terms of the Do What The Fuck You Want To Public License, Version 2, as published
;; by Sam Hocevar. See http://www.wtfpl.net/ for more details.

;;; Commentary:

;; To install, clone .emacs.d/ into ~/.emacs.d/.
;;
;; Following lines load an Org file and build the configuration code out of it. This
;; process is known as tangling.
;;
;; See README.md for more details.

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use better defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when window-system
  (blink-cursor-mode 0)                          ; Disable the cursor blinking
  (scroll-bar-mode 0)                            ; Disable the scroll bar
  (tool-bar-mode 0)                              ; Disable the tool bar
  (tooltip-mode 0))                              ; Disable the tooltips

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar me/font-family            "Open Sans"  "The font to use.")
(defvar me/font-size-default      130       "The font size to use for default text.")
(defvar me/font-size-header       140       "The font size to use for headers.")
(defvar me/font-size-mode-line    130       "The font size to use for the mode line.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some sane defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default
 ad-redefinition-action 'accept                  ; Silence warnings for redefinition
 delete-by-moving-to-trash t                     ; Delete files to trash
 display-time-default-load-average nil           ; Don't display load average
 display-time-format "%H:%M"                     ; Format the time string
 fill-column 85                                  ; Set width for automatic line breaking
 gc-cons-threshold most-positive-fixnum          ; Increase garbage collector treshold
 help-window-select t                            ; Focus new help windows when opened
 indent-tabs-mode nil                            ; Don't use tabs to indent
 inhibit-startup-screen t                        ; Disable start-up screen
 initial-scratch-message ""                      ; Empty the initial *scratch* buffer
 mouse-yank-at-point t                           ; Yank at point rather than cursor
 ns-use-srgb-colorspace nil                      ; Don't use sRGB colors
 scroll-conservatively most-positive-fixnum      ; Always scroll by one line
 select-enable-clipboard t                       ; Merge system's and Emacs' clipboard
 show-trailing-whitespace nil                    ; Display trailing whitespaces
 split-height-threshold nil                      ; Disable vertical window splitting
 split-width-threshold nil                       ; Disable horizontal window splitting
 tab-width 4                                     ; Set width for tabs
 uniquify-buffer-name-style 'forward             ; Uniquify buffer names
 ring-bell-function 'ignore                      ; Be quiet!
 window-combination-resize t)                    ; Resize windows proportionally

(column-number-mode 0)                           ; Hide the column number
(display-battery-mode 0)                         ; Hide the battery level
(display-time-mode 1)                            ; Hide the time representation
(fringe-mode '(10 . 10))                         ; Show vertical fringes
(global-hl-line-mode 1)                          ; Hightlight current line
(global-subword-mode 1)                          ; Iterate through CamelCase words
(line-number-mode 1)                             ; Show the line number
(menu-bar-mode 0)                                ; Disable the menu bar
(mouse-avoidance-mode 'animate)                  ; Move pointer to avoid collision with point
(global-set-key (kbd "C-x C-b") 'ibuffer)        ; Use ibuffer instead of list buffers
(set-default-font me/font-family)
(set-face-attribute 'default nil :height 130)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable some more goodies.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'yes-or-no-p 'y-or-n-p)                    ; Replace yes/no prompts with y/n
(put 'downcase-region 'disabled nil)             ; Enable downcase-region
(put 'upcase-region 'disabled nil)               ; Enable upcase-region
(put 'narrow-to-region 'disabled nil)            ; Enable narrow to region
(put 'narrow-to-page 'disabled nil)              ; Enable narrow to page
(setq create-lockfiles nil)                      ; No need for ~ files when editing
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-below) ; split pane top/bottom
(global-set-key (kbd "M-2") 'delete-window)      ; close current pane
(global-set-key (kbd "M-s") 'other-window)       ; cursor to other pane
(global-set-key (kbd "<f12>") 'ispell)           ; spell check
(global-set-key (kbd "<f6>") 'darkroom-mode)    ; darkroom mode key
(global-set-key (kbd "M-<f6>") 'writeroom-toggle-mode-line)    ; writeroom modeline key
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'join-line)    ; join line
(global-unset-key (kbd "C-M-p"))
(global-set-key (kbd "C-M-p") 'scroll-down-line)    ; scroll down
(global-unset-key (kbd "C-M-n"))
(global-set-key (kbd "C-M-n") 'scroll-up-line)    ; scroll up
(defalias 'ts 'transpose-sentences)
(defalias 'tp 'transpose-paragraphs)
(global-visual-line-mode t)                      ; turn on word wrap
(setq sentence-end-double-space t)                                       ; a sentence does end with a period and two spaces
(winner-mode 1)
(global-set-key (kbd "C-<down>") 'enlarge-window)
(global-set-key (kbd "C-<up>") 'shrink-window)
(global-set-key (kbd "C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(global-set-key (kbd "C-<f5>") 'bookmark-set)
(global-set-key (kbd "<f5>")   'bookmark-jump)
(global-set-key (kbd "S-<f5>") 'list-bookmarks)
(setq bookmark-default-file "~/Dropbox/bookmarks")
(setq bookmark-save-flag 1)

;; Reset garbage collector treshold after initialization is finished and
;; =garbage-collect= on focus-out. Emacs /should/ feel snappier.
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))
(add-hook 'focus-out-hook 'garbage-collect)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add 'lisp' to the load path
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/twittering-mode/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Very basic version scheme / backup routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.

(setq vc-make-backup-files t) ;; versioned backups

;; Default and per-save backups go here:
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Validate Emacs' version
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version<= emacs-version "26")
  (unless (yes-or-no-p "Your Emacs is getting old. Kitten may be killed, continue? ")
    (kill-emacs)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load =.custom.el=
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load =.secret.el=
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(let ((secret.el (expand-file-name ".secret.el" user-emacs-directory)))
  (when (file-exists-p secret.el)
    (load secret.el)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize MELPA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set a color palette
(defconst zenburn/bg+3      "#6F6F6F"  "Zenburn palette: #6F6F6F.")
(defconst zenburn/bg+2      "#5F5F5F"  "Zenburn palette: #5F5F5F.")
(defconst zenburn/bg+1      "#4F4F4F"  "Zenburn palette: #4F4F4F.")
(defconst zenburn/bg+0      "#494949"  "Zenburn palette: #494949.")
(defconst zenburn/bg        "#3F3F3F"  "Zenburn palette: #3F3F3F.")
(defconst zenburn/bg-0      "#383838"  "Zenburn palette: #383838.")
(defconst zenburn/bg-1      "#2B2B2B"  "Zenburn palette: #2B2B2B.")
(defconst zenburn/bg-2      "#000000"  "Zenburn palette: #000000.")
(defconst zenburn/blue+1    "#94BFF3"  "Zenburn palette: #94BFF3.")
(defconst zenburn/blue      "#8CD0D3"  "Zenburn palette: #8CD0D3.")
(defconst zenburn/blue-1    "#7CB8BB"  "Zenburn palette: #7CB8BB.")
(defconst zenburn/blue-2    "#6CA0A3"  "Zenburn palette: #6CA0A3.")
(defconst zenburn/blue-3    "#5C888B"  "Zenburn palette: #5C888B.")
(defconst zenburn/blue-4    "#4C7073"  "Zenburn palette: #4C7073.")
(defconst zenburn/blue-5    "#366060"  "Zenburn palette: #366060.")
(defconst zenburn/cyan      "#93E0E3"  "Zenburn palette: #93E0E3.")
(defconst zenburn/fg+1      "#FFFFEF"  "Zenburn palette: #FFFFEF.")
(defconst zenburn/fg        "#DCDCCC"  "Zenburn palette: #DCDCCC.")
(defconst zenburn/fg-1      "#656555"  "Zenburn palette: #656555.")
(defconst zenburn/green+4   "#BFEBBF"  "Zenburn palette: #BFEBBF.")
(defconst zenburn/green+3   "#AFD8AF"  "Zenburn palette: #AFD8AF.")
(defconst zenburn/green+2   "#9FC59F"  "Zenburn palette: #9FC59F.")
(defconst zenburn/green+1   "#8FB28F"  "Zenburn palette: #8FB28F.")
(defconst zenburn/green     "#7F9F7F"  "Zenburn palette: #7F9F7F.")
(defconst zenburn/green-1   "#5F7F5F"  "Zenburn palette: #5F7F5F.")
(defconst zenburn/magenta   "#DC8CC3"  "Zenburn palette: #DC8CC3.")
(defconst zenburn/orange    "#DFAF8F"  "Zenburn palette: #DFAF8F.")
(defconst zenburn/red+1     "#DCA3A3"  "Zenburn palette: #DCA3A3.")
(defconst zenburn/red       "#CC9393"  "Zenburn palette: #CC9393.")
(defconst zenburn/red-1     "#BC8383"  "Zenburn palette: #BC8383.")
(defconst zenburn/red-2     "#AC7373"  "Zenburn palette: #AC7373.")
(defconst zenburn/red-3     "#9C6363"  "Zenburn palette: #9C6363.")
(defconst zenburn/red-4     "#8C5353"  "Zenburn palette: #8C5353.")
(defconst zenburn/yellow    "#F0DFAF"  "Zenburn palette: #F0DFAF.")
(defconst zenburn/yellow-1  "#E0CF9F"  "Zenburn palette: #E0CF9F.")
(defconst zenburn/yellow-2  "#D0BF8F"  "Zenburn palette: #D0BF8F.")

;; Configure Zenburn
(use-package zenburn-theme
  :demand t
  :config
  (load-theme 'zenburn t)
  (set-face-attribute 'default nil :height me/font-size-default)
  (set-face-attribute 'font-lock-comment-delimiter-face nil
                      :foreground zenburn/bg+3 :italic t)
  (set-face-attribute 'font-lock-comment-face nil :italic t)
  (set-face-attribute 'font-lock-doc-face nil :italic t)
  (set-face-attribute 'font-lock-function-name-face nil :foreground zenburn/blue)
  (set-face-attribute 'fringe nil :background zenburn/bg-0 :foreground zenburn/bg+3)
  (set-face-attribute 'header-line nil
                      :box `(:line-width 1 :color ,zenburn/bg-1)
                      :height me/font-size-header)
  (set-face-attribute 'help-argument-name nil :foreground zenburn/orange)
  (set-face-attribute 'hl-line nil :background zenburn/bg+1)
  (set-face-attribute 'isearch nil :background zenburn/blue :foreground zenburn/bg)
  (set-face-attribute 'region nil :foreground zenburn/green)
  (set-face-attribute 'vertical-border nil :foreground zenburn/bg-1)
  (when (member me/font-family (font-family-list))
    (set-face-attribute 'default nil :font me/font-family)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Features
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Desktop
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package desktop
  :demand t
  :config
  (desktop-save-mode 1)
  (add-to-list 'desktop-globals-to-save 'golden-ratio-adjust-factor))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Writeroom
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package writeroom-mode
  :demand t
  :config
  (setq writeroom-width 120))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Darkroom
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package darkroom  :ensure t :demand t
  :config
  (setq darkroom-text-scale-increase 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Modeline
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package spaceline :demand t
  :config
                    (spaceline-emacs-theme)
(setq powerline-arrow-shape 'arrow))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Autodim
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package auto-dim-other-buffers
  :demand t
  :config
  (auto-dim-other-buffers-mode 1)
  (set-face-attribute 'auto-dim-other-buffers-face nil :background zenburn/bg-0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Abbrev
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs 'silently)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Wordcount
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package wc-mode)

(defun novel-count-words (&optional begin end)
  "count words between BEGIN and END (region); if no region defined, count words in buffer"
  (interactive "r")
  (let ((b (if mark-active begin (point-min)))
      (e (if mark-active end (point-max))))
    (message "Word count: %s" (how-many "\\w+" b e))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org
:ensure t)

(use-package org-bullets)

(setq org-bullets-bullet-list (quote ("◉" "✿" "★" "•")))

(setq inhibit-compacting-font-caches t)

;;(require  'ox-extra)
;; Headlines that has the 'ignore' tag will not be exported!
;;(ox-extras-activate '(ignore-headlines))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)"  "|" "DRAFT(d)")
      (sequence "REVISE(r)" "|" "DONE")
)))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("IDEA" . "goldenrod1")  ("DRAFT" . "SpringGreen") ("REVISE" . "OliveDrab4") "|" ("DONE" . "SeaGreen4")))

(setq org-tag-faces
      '(("ignore" . (:foreground "grey"))))

(add-hook 'org-mode-hook
(lambda () (org-bullets-mode t)))

(setq org-hide-leading-stars t)

(setq org-enforce-todo-dependencies t)

(setq org-hierarchical-todo-statistics nil) ; I want org-mode to cascade done statistics up through the tree

(setq org-tags-column -80)

(let* ((variable-tuple (cond ((x-list-fonts "Open Sans") '(:font "Open Sans"))
                             ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                             ((x-list-fonts "Verdana")         '(:font "Verdana"))
                             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                             (nil (warn "Cannot find a Sans Serif Font.  Install Open Sans."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline ,@variable-tuple))))
                          `(org-level-7 ((t (,@headline ,@variable-tuple))))
                          `(org-level-6 ((t (,@headline ,@variable-tuple))))
                          `(org-level-5 ((t (,@headline ,@variable-tuple))))
                          `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                          `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                          `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                          `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                          `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/Dropbox/skriv/notes.org" "Notes")
	 "* %?\n %a")))

(defun +org/opened-buffer-files ()
  "Return the list of files currently opened in emacs"
  (delq nil
        (mapcar (lambda (x)
                  (if (and (buffer-file-name x)
                           (string-match "\\.org$"
                                         (buffer-file-name x)))
                      (buffer-file-name x)))
                (buffer-list))))

(setq org-refile-targets '((+org/opened-buffer-files :maxlevel . 5)))
(setq org-refile-use-outline-path 'file)
;; makes org-refile outline working with helm/ivy
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)

(setq org-refile-use-cache t)

(run-with-idle-timer 300 t (lambda ()
                                (org-refile-cache-clear)
                                (org-refile-get-targets)))

(global-set-key (kbd "<f7>") 'org-mark-ring-push)
(global-set-key (kbd "M-<f7>") 'org-mark-ring-goto)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Spelling
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ispell-extra-args-around (orig-fun &rest args)
(let ((old-ispell-extra-args ispell-extra-args))
(ispell-kill-ispell t)
;; use emacs original arguments
(setq ispell-extra-args (flyspell-detect-ispell-args))
(apply orig-fun args)
;; restore our own ispell arguments
(setq ispell-extra-args old-ispell-extra-args)
(ispell-kill-ispell t)))
(advice-add 'ispell-word :around #'ispell-extra-args-around)
(advice-add 'flyspell-auto-correct-word :around #'ispell-extra-args-around)
(setq ispell-program-name "hunspell")

(add-to-list 'ispell-skip-region-alist
             '("^ # {{{" . "^ # }}}"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; WriteOrDie
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (not (require 'write-or-die nil t))
        (message "`write-or-die' not found"))

(global-set-key (kbd "<f8>") 'write-or-die-mode)
(global-set-key (kbd "<f9>") 'write-or-die-go)
(global-set-key (kbd "M-<f9>") 'write-or-die-stop)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Transparency
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 50) '(100 . 100)))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; DraftMode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package draft-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Chronos
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package chronos :ensure t :demand t
  :config
   (setq chronos-expiry-functions '(chronos-message-notify chronos-desktop-notifications-notify)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; GuroMode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package guru-mode
  :config
    (guru-global-mode t)
    (guru-mode t)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; AceWindow
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ace-window
  :ensure t
  :init
    (progn
      (global-set-key [remap other-window] 'ace-window)
      (custom-set-faces
        '(aw-leading-char-face
          ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "#DCDCCC")))))
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Swiper
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure t
  :config
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Expandregion
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package expand-region
  :ensure t
  )
(global-set-key (kbd "C-=") 'er/expand-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Markdown
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Ryomodal
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ryo-modal
  :commands ryo-modal-mode
  :bind ("<escape>" . ryo-modal-mode)
  :config
  (ryo-modal-keys
   ("b" backward-char)
   ("n" next-line)
   ("p" previous-line)
   ("f" forward-char))

  (ryo-modal-keys
   ;; First argyment to ryo-modal-keys may be a list of keywords.
   ;; These keywords will be applied to all keybindings.
   (:norepeat t)))

(setq ryo-modal-cursor-color "Goldenrod")
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Speedtype
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package speed-type
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Twittering-mode
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (not (require 'twittering-mode nil t))
        (message "`twittering-mode' not found"))

(setq twittering-use-master-password t)
(setq epa-pinentry-mode 'loopback)
(twittering-enable-unread-status-notifier)
(setq twittering-display-remaining t)
(setq twittering-edit-skeleton 'inherit-any)

(defun twitrender ()
  (interactive)

    (with-current-buffer
      (twittering-rerender-timeline-all (current-buffer) t)
      (setq-local line-spacing 0.2)
      (goto-char (point-min))
      ))

(with-eval-after-load 'twittering-mode 
(defun *twittering-generate-format-table (status-sym prefix-sym)
  `(("%" . "%")
    ("}" . "}")
    ("#" . (cdr (assq 'id ,status-sym)))
    ("'" . (when (cdr (assq 'truncated ,status-sym))
             "..."))
    ("c" .
     (let ((system-time-locale "C"))
       (format-time-string "%a %b %d %H:%M:%S %z %Y"
                           (cdr (assq 'created-at ,status-sym)))))
    ("d" . (cdr (assq 'user-description ,status-sym)))
    ("f" .
     (twittering-make-string-with-source-property
      (cdr (assq 'source ,status-sym)) ,status-sym))
    ("i" .
     (when (and twittering-icon-mode window-system)
       (let ((url
              (cond
               ((and twittering-use-profile-image-api
                     (eq twittering-service-method 'twitter)
                     (or (null twittering-convert-fix-size)
                         (member twittering-convert-fix-size '(48 73))))
                (let ((user (cdr (assq 'user-screen-name ,status-sym)))
                      (size
                       (if (or (null twittering-convert-fix-size)
                               (= 48 twittering-convert-fix-size))
                           "normal"
                         "bigger")))
                  (format "http://%s/%s/%s.xml?size=%s" twittering-api-host
                          (twittering-api-path "users/profile_image") user size)))
               (t
                (cdr (assq 'user-profile-image-url ,status-sym))))))
         (twittering-make-icon-string nil nil url))))
    ("I" .
     (let* ((entities (cdr (assq 'entity ,status-sym)))
            text)
       (mapc (lambda (url-info)
               (setq text (or (cdr (assq 'media-url url-info)) "")))
             (cdr (assq 'media entities)))
       (if (string-equal "" text)
           text
         (let ((twittering-convert-fix-size 600))
           (twittering-make-icon-string nil nil text)))))
    ("j" . (cdr (assq 'user-id ,status-sym)))
    ("L" .
     (let ((location (or (cdr (assq 'user-location ,status-sym)) "")))
       (unless (string= "" location)
         (concat " [" location "]"))))
    ("l" . (cdr (assq 'user-location ,status-sym)))
    ("p" . (when (cdr (assq 'user-protected ,status-sym))
             "[x]"))
    ("r" .
     (let ((reply-id (or (cdr (assq 'in-reply-to-status-id ,status-sym)) ""))
           (reply-name (or (cdr (assq 'in-reply-to-screen-name ,status-sym))
                           ""))
           (recipient-screen-name
            (cdr (assq 'recipient-screen-name ,status-sym))))
       (let* ((pair
               (cond
                (recipient-screen-name
                 (cons (format "sent to %s" recipient-screen-name)
                       (twittering-get-status-url recipient-screen-name)))
                ((and (not (string= "" reply-id))
                      (not (string= "" reply-name)))
                 (cons (format "in reply to %s" reply-name)
                       (twittering-get-status-url reply-name reply-id)))
                (t nil)))
              (str (car pair))
              (url (cdr pair))
              (properties
               (list 'mouse-face 'highlight 'face 'twittering-uri-face
                     'keymap twittering-mode-on-uri-map
                     'uri url
                     'front-sticky nil
                     'rear-nonsticky t)))
         (when (and str url)
           (concat " " (apply 'propertize str properties))))))
    ("R" .
     (let ((retweeted-by
            (or (cdr (assq 'retweeting-user-screen-name ,status-sym)) "")))
       (unless (string= "" retweeted-by)
         (concat " (retweeted by " retweeted-by ")"))))
    ("S" .
     (twittering-make-string-with-user-name-property
      (cdr (assq 'user-name ,status-sym)) ,status-sym))
    ("s" .
     (twittering-make-string-with-user-name-property
      (cdr (assq 'user-screen-name ,status-sym)) ,status-sym))
    ("U" .
     (twittering-make-fontified-tweet-unwound ,status-sym))
    ;; ("D" .
    ;;  (twittering-make-fontified-tweet-unwound ,status-sym))
    ("T" .
     ,(twittering-make-fontified-tweet-text
       `(twittering-make-fontified-tweet-text-with-entity ,status-sym)
       twittering-regexp-hash twittering-regexp-atmark))
    ("t" .
     ,(twittering-make-fontified-tweet-text
       `(twittering-make-fontified-tweet-text-with-entity ,status-sym)
       twittering-regexp-hash twittering-regexp-atmark))
    ("u" . (cdr (assq 'user-url ,status-sym)))))
  (advice-add #'twittering-generate-format-table :override #'*twittering-generate-format-table)
  (defface twitter-divider
    `((t (:underline (:color "grey"))))
    "The vertical divider between tweets."
    :group 'twittering-mode)
  (setq twittering-icon-mode t
        twittering-use-icon-storage t
        twittering-convert-fix-size 40
        twittering-status-format "
  %i  %FACE[font-lock-function-name-face]{  @%s}  %FACE[italic]{%@}  %FACE[error]{%FIELD-IF-NONZERO[❤ %d]{favorite_count}}  %FACE[warning]{%FIELD-IF-NONZERO[↺ %d]{retweet_count}}

%FOLD[   ]{%FILL{%t}
%QT{
%FOLD[   ]{%FACE[font-lock-function-name-face]{@%s}\t%FACE[shadow]{%@}
%FOLD[ ]{%FILL{%t}}
}}}

    %I

%FACE[twitter-divider]{                                                                                                                                                                                  }
"))

;;(setq twittering-convert-fix-size 360)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Magit
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package magit)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-sidebar
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-sidebar)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-trackable
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-tracktable)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org2blog
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org2blog
             :ensure t)

(setq org2blog/wp-blog-alist
      '(("Jacmoe's Cyber Soapbox"
         :url "https://jacmoes.wordpress.com/xmlrpc.php"
         :username "jacmoe")))

(add-hook 'org-mode-hook #'org2blog-maybe-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Dictionary
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dictionary)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-roam
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org-roam
  :after org
  :init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
  :custom
  (org-roam-direçtory "~/RoamNotes")
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n r" . org-roam-node-random)		    
         (:map org-mode-map
               (("C-c n i" . org-roam-node-insert)
                ("C-c n o" . org-id-get-create)
                ("C-c n t" . org-roam-tag-add)
                ("C-c n a" . org-roam-alias-add)
                ("C-c n l" . org-roam-buffer-toggle))))
  :config
  (org-roam-setup)
)
