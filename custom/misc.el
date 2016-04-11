;;; Commentary:
;; Misc settings

;; Guru mode on
(guru-global-mode +1)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)

(setq make-backup-files nil) ; Don't want any backup files
