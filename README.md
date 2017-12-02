# dotfiles
My personal OSX installation system.


## Description

I was reading [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) and was inspired to create a configuration that would automate the setting up of a new OSX machine.

I wanted to learn from the ground up so I simplified the process outlined by [Lars Kappert](https://medium.com/@webprolific), copying files and directories rather than adding the sym links.

My simpler structure has a `.bash_profile` which contains the functions and alias rather than them being in separate files.

Using [brew](https://brew.sh/) and [n-install](https://github.com/mklement0/n-install#n-install-&mdash-introduction) to install [n (Node Version Manager)](https://www.npmjs.com/package/n) I managed to get the installation script down to just a few lines.


## Installation

Personalise the `name` and `email` fields in the git/.gitconfig file.

Add or remove applications in the install.sh/brew install and brew cask install tasks.

Available brew applications can be found by running `brew search (app-name)` or `brew cask search (app-name)`


Run the following commands and respond to prompts.

```
cd ~

git checkout https://github.com/russellf9/dotfiles.git

cd dotfile

sh install.sh

```

**Notes:**

The default OSX comes with versions of _git_ and _bash_ and the `brew cask install` task updates them.


## Summary of shortcuts which will be installed

`l`  - List in long format, include dotfiles
`ld`-  List in long format, only directories
`week` -  Get week number
`open_bash` - Will open the .bash_profile
`mk` - Create a new directory and enter it
`fs` - Determine size of a file or total size of a directory
`manpdf` - Open a terminal manual page as a PDF - `manpdf ls`
`updateApps` - Update App Store apps
`delete_all_downloads` - Deletes all files in `~/Downloads/`
`empty_trash` - Empties the trash





## Webstorm Settings

I'm using [Settings Repository](https://plugins.jetbrains.com/plugin/7566-settings-repository) to save my Webstorm configuration across my home and work machines and this is working well so far.


## Links

* [garystevens - dotfiles](https://github.com/garystevens/dotfiles)

* [using-git-and-github-to-manage-your-dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)


## Caveats

The script has only been partially tested and this is very much a version 1!
Feel free to fork and comment or raise issues.

## Contact

* email: russell@factornine.co.uk
* twitter: @russellf9
