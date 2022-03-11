# emacs.d
My emacs configuration, optimized for creative writing.

![](https://github.com/jacmoe/emacs.d/blob/master/emacsd.png)

## Prerequisites ##

### Emacs 27.1

This configuration requires at least Emacs 27.1.

If you have an older version installed, you need to install a new version. Version 27.2 is recommended, but 27.1 will do.

If you do not want to upgrade your version of Emacs, you can comment out the `vertico` section of `init.el`, but upgrading is going to be worth the trouble!

### Fonts ###

Install Open Sans if it's not already installed on your system.

### Hunspell

#### Linux

Install `hunspell` using your package manager

#### Windows

Download `hunspell` from [ezwinports](https://sourceforge.net/projects/ezwinports/files/hunspell-1.3.2-3-w32-bin.zip/)

Extract the archive and add the `bin` folder to your PATH variable so that Emacs can find `hunspell`.

British and American English dictionaries are included, but if you need a dictionary for your language, you can download it from [https://www.freeoffice.com/en/download/dictionaries](https://www.freeoffice.com/en/download/dictionaries)

Open and extract using 7zip or similar program. I believe you can change the extension to `.zip` if your archiver doesn't recognize it as an archive.

Put the dictionary files, `.aff` and `.dic` into the `share/hunspell` in your `hunspell` directory.

### C compiler

`org-roam` uses a custom SQLite binary to store its database, and it will compile it when it installs. So there must be a C compiler available to Emacs.

On Linux, there are very likely to be a C compiler installed, but Windows is different.

See [https://www.orgroam.com/manual.html#C-Compiler](https://www.orgroam.com/manual.html#C-Compiler) for how to install a C compiler compatible with Emacs on Windows.

If you don't want to deal with the C compiler, you need to comment out the `org-roam` section of `init.el`, but you don't want to miss out on the amazing features that `org-roam` provides! It's definitely worth the extra effort.

## Installation ##

Clone this repository into `.emacs.d` in your home directory. That would be in `C:/Users/[username]/.emacs.d` on Windows, and `~/.emacs.d` on Linux.

**Important!**
If you are on Windows, you need to set the `HOME` environment variable to point to your user directory (usually `c:/Users/[username]`). This Emacs configuration uses it to determine the location of the Emacs configuration directory when you are on Windows.


## How to use it ##

See the [Emacs survival guide](emacs.org) where most of the keyboard commands are listed.


See my [Creative Writing with Emacs](https://jacmoes.wordpress.com/2019/09/24/creative-writing-with-emacs/) blog post.
