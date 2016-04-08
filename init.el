(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(defvar my-customizations-folder
  (concat user-emacs-directory "custom/"))

(defvar my-customizations
  '("ui"
    "navigation"
    "misc"
    "irc"
    "editing"
    "programming"))

(dolist (c my-customizations)
  (load (concat my-customizations-folder c ".el")))

