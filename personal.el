(defconst my-dictionary "en_US")

;; The theme can be "light" or "dark"
;; When changing this variable, due to how desktop-mode works, you need to go to "init.el"
;; and run "M-x eval-buffer" to remove garbage colors from previous theme
(defconst my-theme-shade "dark")

;; Turn off interface elements. Use t for true, 0 for false
(setq my-blink-cursor-mode t) ; Should the cursor blink?
(setq my-scroll-bar-mode 0)   ; Enable/disable the scroll bar
(setq my-tool-bar-mode 0)     ; Enable/disable the tool bar
(setq my-menu-bar-mode 0)     ; Enable/disable the menu bar

(defconst my-bookmarks "~/Dropbox/bookmarks")

(defconst my-bloglist
      '(("Jacmoes Cyber Soapbox"
         :url "https://jacmoes.wordpress.com/xmlrpc.php"
         :username "jacmoe")))

(defconst my-org-clock-sound "~/.emacs.d/res/siren.wav")

(defconst my-org-capture-notes "~/Dropbox/skriv/notes.org" "Notes")

(defconst my-org-roam-directory "~/RoamNotes")

(setq my-org-tracktable-daily-goal 1000)

(setq my-font-size 130)  ;base font size. Try 150 or 170 if too small
;; choose fonts that you have installed, fixed width is mono spaced
;; Courier New, DejaVu Sans Mono
(defvar my-fixed-font-family "Courier New") 
;; ETBembo, Bookman BT, Merriweather, Trebuchet MS, Open Sans, Comic Sans MS, Garamond, Times New Roman, Century Schoolbook
(defvar my-variable-font-family "ETBembo") 

;; use boon? If so, use t instead of nil
(setq my-use-boon t)

(setq my-line-spacing 6)
