;;; Commentary:
;; Misc settings
(desktop-save-mode 1) ; save/restore opened files

;; Guru mode on
(guru-global-mode +1)

;; Editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)

(setq make-backup-files nil) ; Don't want any backup files
