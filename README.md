# emacs.d
My emacs configuration, optimized for creative writing.

![](https://github.com/jacmoe/emacs.d/blob/master/emacsd.png)

## Prerequisites ##

### Emacs 27.1

This configuration requires at least Emacs 27.1.

If you have an older version installed, you need to install a new version. Version 27.2 is recommended, but 27.1 will do.

If you do not want to upgrade your version of Emacs, you can comment out the `vertico` section of `init.el`, but upgrading is going to be worth the trouble!

### C compiler

`org-roam` uses a custom SQLite binary to store its database, and it will compile it when it installs. So there must be a C compiler available to Emacs.

On Linux, there are very likely to be a C compiler installed, but Windows is different.

One option is to use MSYS2, which is Linux distribution for Windows. Follow the instructions on [MSYS2 home page](https://www.msys2.org/). Be sure to install the full mingw-w64 GCC software collection.

Make sure that you add the `bin` directory of you MSYS2 installation to your system path, so that Emacs can find it.

On my machine, I had to add `C:\msys64\mingw64\bin`

### Aspell

#### Linux

If Aspell is not installed, install `aspell` using your package manager.

#### Windows

Assuming that you installed MSYS2, including the mingw compiler suite, you can simply open up a MSYS2 command line and run:

`pacman -Ss aspell`

That will give you a list of aspell related packages to install.

Here's the packages that I installed:

`pacman -S mingw-w64-x86_64-aspell`

`pacman -S mingw-w64-x86_64-aspell-en`

If you followed the guide for how to install the C compiler, then Emacs will be able to find `aspell`, and all should be well.

### Proselint

Proselint is required by the on-the-fly language checker.

Simply follow the [Proselint installation instructions](https://github.com/amperser/proselint#installation) and make sure to, if on Windows, to add the location of the Proselint binary to your PATH. The message you get from Python's pip installation procedure reminds you of what exact path you need to add.


## Installation ##

Clone this repository, or download archive and extract, into `.emacs.d` in your home directory. That would be in `C:/Users/[username]/.emacs.d` on Windows, and `~/.emacs.d` on Linux.

Create `secret.el` using `secret.el.template` as a template.

**Important!**
If you are on Windows, you need to set the `HOME` environment variable to point to your user directory (usually `c:/Users/[username]`). This Emacs configuration uses it to determine the location of the Emacs configuration directory when you are on Windows.


## How to use it ##

See the [Emacs survival guide](emacs.md) where most of the keyboard commands are listed. I usually have it open in a buffer for whenever I am wondering what keyboard command to use.

See my [Creative Writing with Emacs](https://jacmoes.wordpress.com/2019/09/24/creative-writing-with-emacs/) blog post for a more thorough explanation, and rationale, for using Emacs for creative writing.
