;; -*- lexical-binding: t; -*-
;;; init.el --- My Emacs configuration, optimized for creative writing

;; Copyright (C) 2017-2022 Jacob Moen

;; Author: Jacob Moen <jacmoe.dk@gmail.com>
;; Homepage: https://github.com/jacmoe/.emacs.d

;; This program is free software. It comes without any warranty, to the extent
;; permitted by applicable law. You can redistribute it and/or modify it under the
;; terms of the Do What The Fuck You Want To Public License, Version 2, as published
;; by Sam Hocevar. See http://www.wtfpl.net/ for more details.

;; To install, clone .emacs.d/ into ~/.emacs.d/.
;;
;; See README.md for more details.


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
 show-trailing-whitespace nil                    ; Do not display trailing whitespaces
 split-height-threshold nil                      ; Disable vertical window splitting
 split-width-threshold nil                       ; Disable horizontal window splitting
 tab-width 4                                     ; Set width for tabs
 uniquify-buffer-name-style 'forward             ; Uniquify buffer names
 ring-bell-function 'ignore                      ; Be quiet!
 window-combination-resize t)                    ; Resize windows proportionally

(column-number-mode 0)                           ; Hide the column number
(display-battery-mode 0)                         ; Hide the battery level
(display-time-mode 1)                            ; Hide the time representation
(fringe-mode '(80 . 80))                         ; Show vertical fringes
(global-hl-line-mode 0)                          ; Do not hightlight current line
(global-subword-mode 1)                          ; Iterate through CamelCase words
(mouse-avoidance-mode 'animate)                  ; Move pointer to avoid collision with point
(global-set-key (kbd "C-x C-b") 'ibuffer)        ; Use ibuffer instead of list buffers

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable some more goodies.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'yes-or-no-p 'y-or-n-p)                      ; Replace yes/no prompts with y/n
(put 'downcase-region 'disabled nil)               ; Enable downcase-region
(put 'upcase-region 'disabled nil)                 ; Enable upcase-region
(put 'narrow-to-region 'disabled nil)              ; Enable narrow to region
(put 'narrow-to-page 'disabled nil)                ; Enable narrow to page
(setq create-lockfiles nil)                        ; No need for ~ files when editing
(global-set-key (kbd "M-3") 'delete-other-windows) ; expand current pane
(global-set-key (kbd "M-4") 'split-window-below)   ; split pane top/bottom
(global-set-key (kbd "M-2") 'delete-window)        ; close current pane
(global-set-key (kbd "M-s") 'other-window)         ; cursor to other pane
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'join-line)            ; join line
(global-unset-key (kbd "C-M-p"))
(global-set-key (kbd "C-M-p") 'scroll-down-line)   ; scroll down
(global-unset-key (kbd "C-M-n"))
(global-set-key (kbd "C-M-n") 'scroll-up-line)     ; scroll up
(defalias 'ts 'transpose-sentences)
(defalias 'tp 'transpose-paragraphs)
(global-visual-line-mode t)                        ; turn on word wrap
(setq sentence-end-double-space nil)               ; a sentence ends with only one space
(winner-mode 1)
(global-set-key (kbd "C-<down>") 'enlarge-window)
(global-set-key (kbd "C-<up>") 'shrink-window)
(global-set-key (kbd "C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<f5>") 'bookmark-set)
(global-set-key (kbd "<f5>")   'bookmark-jump)
(global-set-key (kbd "S-<f5>") 'list-bookmarks)
(global-set-key (kbd "C-`") 'diff-buffer-with-file) ; view what is modified
(setq bookmark-save-flag 1)
(recentf-mode 1)                                    ; Remember recently opened files
(global-set-key (kbd "C-c r") 'recentf-open-files)
;; Remember and restore the last cursor location of opened files
(save-place-mode 1)
;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)
;; Open dired in same buffer
(put 'dired-find-alternate-file 'disabled nil)
;; Sort Dired buffers
(setq dired-listing-switches "-agho --group-directories-first")
;; Reset garbage collector treshold after initialization is finished and
;; =garbage-collect= on focus-out. Emacs /should/ feel snappier.
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))
(add-hook 'focus-out-hook 'garbage-collect)
;; Don't ask to kill running processes when exiting Emacs. Just kill them! :)
(setq confirm-kill-processes nil)
;; convince Emacs to trust themes so that we can install them
(setq custom-safe-themes t)
;; parentheses
(show-paren-mode)
(electric-pair-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Validate Emacs' version
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version<= emacs-version "27")
  (unless (yes-or-no-p "This Emacs configuration requires at least Emacs 27.1. Continue anyway? ")
    (kill-emacs)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load =custom.el=
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load =personal.el=
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load personal settings from personal.el which needs to be created.
;; If using Ratpoison, load personal settings from rats-personal.el
;; See personal.el.example
(if (equal (getenv "RATPOISON") "ratpoison")
    (progn
      (let ((rats-personal.el (expand-file-name "rats-personal.el" user-emacs-directory)))
        (when (file-exists-p rats-personal.el)
          (load rats-personal.el)))
      )
  (let ((personal.el (expand-file-name "personal.el" user-emacs-directory)))
    (when (file-exists-p personal.el)
      (load personal.el)))
  )


;; Apply settings
(setq bookmark-default-file my-bookmarks)   ; Where to save the bookmarks file
(setq-default line-spacing my-line-spacing) ; The amount of space between lines in pixels
(blink-cursor-mode my-blink-cursor-mode)    ; Enable/disable the cursor blinking
(scroll-bar-mode my-scroll-bar-mode)        ; Enable/disable the scroll bar
(tool-bar-mode my-tool-bar-mode)            ; Enable/disable the tool bar
(menu-bar-mode my-menu-bar-mode)            ; Enable/disable the menu bar

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize the Emacs package manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fix for not being able to install undo-tree
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Dependency checks and [[https://melpa.org][MELPA]] initialization, sugar-wrapped.
;;
;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; In order to have unified package declarations in my Emacs files, I use
;; [[https://github.com/jwiegley/use-package][use-package]]. It allows for isolation and
;; clarity.

;; "The =use-package= macro allows you to isolate package configuration in your =.emacs=
;; file in a way that is both performance-oriented and, well, tidy. I created it because
;; I have over 80 packages that I use in Emacs, and things were getting difficult to
;; manage. Yet with this utility my total load time is around 2 seconds, with no loss of
;; functionality!"
;; ~John Wiegley
;;
;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Theme
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package spacemacs-theme
  :defer t
  :init
  (if (equal my-theme-shade "dark")
      (load-theme 'spacemacs-dark t)
    (load-theme 'spacemacs-light t)
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Features
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Desktop
;; Modeline
;; Vertico, savehist, and Marginalia
;; CtrlF
;; Abbrev
;; Yasnippet
;; ISpell
;; Org-mode
;; Mixed-pitch
;; Transparency
;; Wc-mode
;; Acewindow
;; Magit
;; Org2blog
;; Org-sidebar
;; Org-tracktable
;; Writeroom
;; Org-roam
;; Org-roam-ui
;; Deft
;; Boon
;; Undo-tree
;; Mw-thesaurus
;; Emacs-powerthesaurus
;; Flymake-proselint
;; Move-text
;; Aggressive-indent
;; Diminish
;; Auto-package-update
;; Miscellaneous


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Desktop
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Save and restore Emacs status, including buffers, modes, point and windows.
(use-package desktop
  :demand t
  :config
  (if (equal (getenv "RATPOISON") "ratpoison")
      (setq desktop-base-file-name ".ratpoison.desktop")
    )
  (desktop-save-mode 1)
  (add-to-list 'desktop-globals-to-save 'golden-ratio-adjust-factor))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Modeline
;;
;; https://github.com/TheBB/spaceline][Eivind Fonn]]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;- Green means buffer is clean.
;;- Red means buffer is modified.
;;- Blue means buffer is read-only.
;;- Colored bullets represent =flycheck= critical, warning and informational errors.
;;- The segment next to the clock indicate the current perspective from =persp-mode=,
;;  red when the buffer doesn't belong to the current perspective.
;;
;;Spaceline, is a mode-line configuration framework. Like what =powerline= does but at
;;a shallower level. It's still very customizable nonetheless.
;;
;;This is the package that provides [[http://spacemacs.org/][Spacemacs]] with its
;;famous mode-line theme. It has been extracted as an independent package for general
;;fun and profit.
;;
(use-package spaceline :demand t
  :config
  (spaceline-emacs-theme)
  (setq powerline-arrow-shape 'arrow))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Vertico, savehist, and Marginalia
;;
;; https://github.com/minad/vertico
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Vertico provides a performant and minimalistic vertical completion UI based on the default completion system. 

;; Minimal interface for minibuffer completions
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia/annotators-light nil))
  :init
  (marginalia-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; CtrlF
;;
;; https://github.com/raxod502/ctrlf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ctrlf
  :ensure t
  :config
  (ctrlf-mode t)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Abbrev
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-text for Emacs

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs 'silently)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Yasnippet
;;
;; https://github.com/joaotavora/yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A template system for Emacs
(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"                 ;; personal snippets
          ))
  (yas-global-mode 1)
  :bind
  (
   ("C-c s n" . yas-new-snippet)
   ("C-c s v" . yas-visit-snippet-file)
   )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ISpell
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Interactive spelling
(use-package ispell
  :config
  (setq ispell-program-name "aspell")
  (setq ispell-dictionary my-dictionary)
  (add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
  (add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
  (add-to-list 'ispell-skip-region-alist '("^# {{{" . "^# }}}"))
  :bind (("<f12>" . ispell-buffer)
         ("S-<f12>" . ispell-word)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-mode
;;
;; https://orgmode.org/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A GNU Emacs major mode for keeping notes, authoring documents, computational notebooks,
;; literate programming, maintaining to-do lists, planning projects, and more — in a fast and effective plain text system.
(use-package org
  :ensure t)

;; Nice bullets
(use-package org-superstar
  :config
  (setq org-superstar-special-todo-items t)
  (add-hook 'org-mode-hook (lambda ()
                             (org-superstar-mode 1))))

(setq inhibit-compacting-font-caches t)

(setq org-superstar-headline-bullets-list (quote ("◉" "✿" "★" "•")))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)"  "|" "DRAFT(d)")
              (sequence "REVISE(r)" "|" "DONE")
              )))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("IDEA" . "goldenrod1")  ("DRAFT" . "SpringGreen") ("REVISE" . "OliveDrab4") "|" ("DONE" . "SeaGreen4")))

(setq org-tag-faces
      '(("ignore" . (:foreground "grey"))))

(setq org-hide-leading-stars t)

(setq org-enforce-todo-dependencies t)

(setq org-hierarchical-todo-statistics nil) ; I want org-mode to cascade done statistics up through the tree

(setq org-tags-column -80)

(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("n" "Note" entry (file+headline my-org-capture-notes "Notes")
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

;; Org-mode timer settings
(setq org-clock-sound my-org-clock-sound)
(global-set-key(kbd "C-c C-x t") 'org-timer-set-timer)
(global-set-key(kbd "C-c C-x p") 'org-timer-pause-or-continue)
(global-set-key(kbd "C-c C-x a") 'org-timer-start) ; activate
(global-set-key(kbd "C-c C-x e") 'org-timer-stop)  ; end

;; Enable the markdown exporter
(require 'ox-md)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Mixed-pitch
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (font-family-list) C-j
(use-package mixed-pitch
  :hook
  (text-mode . mixed-pitch-mode)
  )
(set-face-attribute 'default nil :font my-fixed-font-family :height my-font-size)
(set-face-attribute 'fixed-pitch nil :font my-fixed-font-family)
(set-face-attribute 'variable-pitch nil :font my-variable-font-family)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Transparency
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Toggles background transparency
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
         '(90 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Wc-mode
;;
;; https://github.com/bnbeckwith/wc-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Word count minor mode for Emacs
(use-package wc-mode
  :bind
  ("C-c w" . wc-mode))

(defun novel-count-words (&optional begin end)
  "count words between BEGIN and END (region); if no region defined, count words in buffer"
  (interactive "r")
  (let ((b (if mark-active begin (point-min)))
        (e (if mark-active end (point-max))))
    (message "Word count: %s" (how-many "\\w+" b e))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; AceWindow
;;
;; https://github.com/abo-abo/ace-window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quickly switch windows in Emacs
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
;; Magit
;;
;; https://magit.vc/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A git client for emacs
(use-package magit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org2blog
;;
;; https://github.com/org2blog/org2blog
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org2blog
  :ensure t)

(setq org2blog/wp-blog-alist my-bloglist)


(add-hook 'org-mode-hook #'org2blog-maybe-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-sidebar
;;
;; https://github.com/alphapapa/org-sidebar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-sidebar)
(defalias 'sbtree 'org-sidebar-tree)
(defalias 'sbtreet 'org-sidebar-tree-toggle)
(defalias 'sb 'org-sidebar)
(defalias 'sbt 'org-sidebar-toggle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-tracktable
;;
;; https://github.com/tty-tourist/org-tracktable
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; an emacs/org-mode package for tracking your writing progress in an org-table.
(use-package org-tracktable
  :config
  (setq org-tracktable-daily-goal my-org-tracktable-daily-goal))
(defalias 'tti 'org-tracktable-insert-table)
(defalias 'ttw 'org-tracktable-write)
(defalias 'tts 'org-tracktable-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Writeroom
;;
;; https://github.com/joostkremers/writeroom-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Distraction-free screen
;;"Writeroom-mode is a minor mode for Emacs that implements a distraction-free writing mode similar to the famous Writeroom editor for OS X."
(use-package writeroom-mode
  :bind
  (
   ("C->" . writeroom-increase-width)
   ("C-<" . writeroom-decrease-width)
   ("<f9>" . writeroom-mode)
   ("S-<f9>" . writeroom-toggle-mode-line )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-roam
;;
;; https://github.com/org-roam/org-roam
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-roam
  :ensure t
  :demand t  ;; Ensure org-roam is loaded by default
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory my-org-roam-directory)
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n I" . org-roam-node-insert-immediate)
         ("C-c n p" . my/org-roam-find-project)
         ("C-c n t" . my/org-roam-capture-task)
         ("C-c n b" . my/org-roam-capture-inbox)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(defun my/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun my/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (my/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

(defun my/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (my/org-roam-list-notes-by-tag "Project")))

;; Build the agenda list the first time for the session
(my/org-roam-refresh-agenda-list)

(defun my/org-roam-project-finalize-hook ()
  "Adds the captured project file to `org-agenda-files' if the
capture was not aborted."
  ;; Remove the hook since it was added temporarily
  (remove-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Add project file to the agenda list if the capture was confirmed
  (unless org-note-abort
    (with-current-buffer (org-capture-get :buffer)
      (add-to-list 'org-agenda-files (buffer-file-name)))))

(defun my/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (my/org-roam-filter-by-tag "Project")
   :templates
   '(("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
      :unnarrowed t))))

(defun my/org-roam-capture-inbox ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* %?"
                                   :if-new (file+head "Inbox.org" "#+title: Inbox\n")))))

(defun my/org-roam-capture-task ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Capture the new task, creating the project file if necessary
  (org-roam-capture- :node (org-roam-node-read
                            nil
                            (my/org-roam-filter-by-tag "Project"))
                     :templates '(("p" "project" plain "** TODO %?"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                                                          ("Tasks"))))))

(defun my/org-roam-copy-todo-to-today ()
  (interactive)
  (let ((org-refile-keep t) ;; Set this to nil to delete the original!
        (org-roam-dailies-capture-templates
         '(("t" "tasks" entry "%?"
            :if-new (file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Tasks")))))
        (org-after-refile-insert-hook #'save-buffer)
        today-file
        pos)
    (save-window-excursion
      (org-roam-dailies--capture (current-time) t)
      (setq today-file (buffer-file-name))
      (setq pos (point)))

    ;; Only refile if the target file is different than the current file
    (unless (equal (file-truename today-file)
                   (file-truename (buffer-file-name)))
      (org-refile nil nil (list "Tasks" today-file nil pos)))))

(add-to-list 'org-after-todo-state-change-hook
             (lambda ()
               (when (equal org-state "DONE")
                 (my/org-roam-copy-todo-to-today))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Org-roam-ui
;;
;; https://github.com/org-roam/org-roam-ui
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start nil)
  (add-to-list 'desktop-minor-mode-table
               '(org-roam-ui-mode nil))
  (add-to-list 'desktop-minor-mode-table
               '(org-roam-ui-follow-mode nil))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Deft
;;
;; https://github.com/jrblevin/deft
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package deft
  :config
  (setq deft-directory my-org-directory
        deft-recursive t
        deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n"
        deft-use-filename-as-title t)
  :bind
  ("C-c d" . deft))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Boon
;;
;; https://github.com/jyp/boon
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; An Ergonomic Command Mode for Emacs
;; Run tutorial with M-x boon-tutorial
(use-package boon
  :ensure t
  :init
  (require 'boon-qwerty)
  (require 'boon-tutorial)
  (require 'boon-powerline)
  :config
  (if (eq my-use-boon t)
      (progn 
        (boon-mode)
        (boon-powerline-theme)
        (setq boon-insert-cursor-color "orange")
        (if (equal my-theme-shade "dark")
            (progn
              (setq boon-default-cursor-color "white")
              (set-face-attribute 'boon-modeline-ins nil :background "orange" :foreground "black")
              )
          (setq boon-default-cursor-color "black")
          (set-face-attribute 'boon-modeline-ins nil :background "orange" :foreground "white")
          )
        (set-face-attribute 'boon-modeline-cmd nil :background "LightSkyBlue1" :foreground "black")
        (define-key boon-command-map "L" 'forward-sentence)
        (define-key boon-command-map "K" 'backward-sentence)
        (add-hook 'ibuffer-hook 'turn-off-boon-mode)
        ))
  :bind
  ("C-c b" . turn-on-boon-mode)
  ("C-c e" . turn-off-boon-mode)
  ("C-;" . boon-set-command-state); used to quit insert mode
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Undo-tree
;;
;; https://gitlab.com/tsc25/undo-tree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Mw-thesaurus
;;
;; https://github.com/agzam/mw-thesaurus.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package mw-thesaurus
  :ensure t
  :init
  (if (boundp 'my-mw-api-key)
      (setq mw-thesaurus--api-key my-mw-api-key))
  :bind
  ("<f6>" . mw-thesaurus-lookup-dwim)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs-powerthesaurus
;;
;; https://github.com/SavchenkoValeriy/emacs-powerthesaurus
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package powerthesaurus
  :ensure t
  :bind
  ("C-c p d" . powerthesaurus-lookup-definitions-dwim)
  ("C-c p t" . powerthesaurus-lookup-sentences-dwim)
  ("S-<f8>" . powerthesaurus-lookup-antonyms-dwim)
  ("<f8>" . powerthesaurus-lookup-synonyms-dwim)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Flymake-proselint
;;
;; https://github.com/manuel-uberti/flymake-proselint
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package flymake-proselint
  :ensure t
  :init
  (add-hook 'text-mode-hook (lambda ()
                              (flymake-mode)
                              (flymake-proselint-setup)))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Move-text
;;
;; https://github.com/emacsfodder/move-text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package move-text
  :ensure t
  :init
  (move-text-default-bindings)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Aggressive-indent
;;
;; https://github.com/Malabarba/aggressive-indent-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package aggressive-indent
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Diminish
;;
;; https://github.com/myrjola/diminish.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package diminish
  :ensure t
  :config
  (diminish 'boon-local-mode)
  (diminish 'undo-tree-mode)
  (diminish 'abbrev-mode)
  (diminish 'aggressive-indent-mode)
  (diminish 'eldoc-mode)
  (diminish 'visual-line-mode)
  (diminish 'subword-mode)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Auto-package-update
;;
;; https://github.com/rranelli/auto-package-update.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-interval 7)
  (auto-package-update-maybe))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Miscellaneous
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; switch to Danish keyboard layout
(defun my/kbdk ()
  (interactive)
  (call-process-shell-command "setxkbmap" nil nil nil "dk")
  )

;; switch to American keyboard layout
(defun my/kbus ()
  (interactive)
  (call-process-shell-command "setxkbmap" nil nil nil "us")
  )

(define-key global-map "\C-ck" 'my/kbdk)
(define-key global-map "\C-cu" 'my/kbus)

;; kill current buffer, without confirmation
(defun delete-current-buffer ()
                                        ; deletes the current buffer
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'delete-current-buffer)

;; align comments
(defun my-align-comments (beginning end)
  "Align comments within marked region."
  (interactive "*r")
  (let (indent-tabs-mode align-to-tab-stop)
    (align-regexp beginning end (concat "\\(\\s-*\\)"
                                        (regexp-quote comment-start)))))
