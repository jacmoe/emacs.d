;; sample use of emacs abbreviation feature

(define-abbrev-table 'global-abbrev-table '(

    ;; math/unicode symbols
    ("8in" "∈")
    ("8nin" "∉")
    ("8inf" "∞")
    ("8luv" "♥")
    ("8smly" "☺")

    ;; normal english words
    ("8alt" "alternative")
    ("8char" "character")
    ("8def" "definition")
    ("8bg" "background")
    ("8kb" "keyboard")
    ("8ex" "example")
    ("8kbd" "keybinding")
    ("8env" "environment")
    ("8var" "variable")
    ("8ev" "environment variable")
    ("8cp" "computer")

    ;; signature
    ("8jm" "Jacob Moen")

    ;; url
    ("8jms" "https://jacmoe.dk/")

    ;; shell commands
    ("8cr" "cargo run")
    ("8cb" "cargo build")
    ("8dp" "deployer deploy")

    ;; Danish words
    ("8mvh" "Med venlig hilsen")

))
;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)
