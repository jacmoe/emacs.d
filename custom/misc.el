;;; Commentary:
;; Misc settings

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)

(setq make-backup-files nil) ; Don't want any backup files
