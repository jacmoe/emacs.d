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

;; (package-initialize)

;; Tangle configuration
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "jacmoe.org" user-emacs-directory))

;;; init.el ends here
