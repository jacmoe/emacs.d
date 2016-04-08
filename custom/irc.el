(setq my-credentials-file "~/.emacs.d/custom/private.el")

(defun my-nickserv-password (_)
  (with-temp-buffer
    (insert-file-contents-literally my-credentials-file)
    (plist-get (read (buffer-string)) :nickserv-password)))

(setq circe-network-options
      '(("Freenode"
         :nick "jacmoe"
         :sasl-username "jacmoe"
         :channels ("#rust")
         :nickserv-password my-nickserv-password)))
