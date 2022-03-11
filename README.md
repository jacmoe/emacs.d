# emacs.d
My emacs configuration, optimized for creative writing.

![](https://github.com/jacmoe/emacs.d/blob/master/emacsd.png)

## Prerequisites ##

### Fonts ###

Install Open Sans if it's not already installed on your system.

### Hunspell

#### Linux

Install `hunspell` using your package manager

#### Windows

Download `hunspell` from [ezwinports][https://sourceforge.net/projects/ezwinports/files/hunspell-1.3.2-3-w32-bin.zip/]

Extract the archive and add the `bin` folder to your PATH variable so that Emacs can find `hunspell`.

British and American English dictionaries are included, but if you need a dictionary for your language, you can download it from [https://www.freeoffice.com/en/download/dictionaries][https://www.freeoffice.com/en/download/dictionaries]

Open and extract using 7zip or similar program. I believe you can change the extension to `.zip` if your archiver doesn't recognize it as an archive.

Put the dictionary files, `.aff` and `.dic` into the `share/hunspell` in your `hunspell` directory.

### C compiler

`org-roam` uses a custom SQLite binary to store its database, and it will compile it when it installs. So there must be a C compiler available to Emacs.

On Linux, there are very likely to be a C compiler installed, but Windows is different.

See [https://www.orgroam.com/manual.html#C-Compiler][https://www.orgroam.com/manual.html#C-Compiler] for how to install a C compiler compatible with Emacs on Windows.

## Installation ##
### Windows ###
**Important!**
You need to set the `HOME` environment variable to point to your user directory (usually `c:/Users/[username]`)

## How to use it ##
See my [Creative Writing with Emacs](https://jacmoes.wordpress.com/2019/09/24/creative-writing-with-emacs/) blog post.
