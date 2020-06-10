# dotfiles
My personal OSX installation system.


## Description

I was reading [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) and was inspired to create a configuration that would automate the setting up of a new OSX machine.

I wanted to learn from the ground up so I simplified the process outlined by [Lars Kappert](https://medium.com/@webprolific), copying files and directories rather than adding the sym links.

My simpler structure has a `.bash_profile` which contains the functions and alias rather than them being in separate files.

Added some improvements from [codeinthehole/osx_bootstrap.sh](https://gist.github.com/codeinthehole/26b37efa67041e1307db).

## Installation

Install XCode first from the App Store so Homebrew can access the libraries.

Some apps don't have a cask and so still need to be installed by hand, including Twitter.


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
## Update 9 June 2020

I'm in the process of bootstrapping a new Mac Book and am trying to update the scripts etc first.

- [X] Use NVM rather than n (and don't install using brew)
- [X] Add an improvement so we check for the existence of Homebrew before installing it.
- [X] Make a note to install X-Code manually first
- [X] Update the `bash_profile` with new snippets etc...
- [X] Update links and information 
- [X] Oh-My-Zsh 
- [X] add `zsh` to brew
- ~[ ] Update Hammerspoon file~
- [ ] See if the copy part for the Hammerspoon file works (if not make script)
- [X] Update Karibiner-Elements Key Binding file if possible. (Is in `.keyboard` location)
- [X] Vimrc 
- [X] and other Vim files and folders
- [ ] Update .gitconfig? (see later)
- [X] Remove Qudini specific stuff
- [ ] Add global NPM modules to script
- [ ] Remove .idea folder (run script first to test how the script works)
- [ ] Make script to copy Hammerspoon file (see `hyper-apps.sh`)

**Notes:**

The default OSX comes with versions of _git_ and _bash_ and the `brew cask install` task updates them.


## Text-Editing Rocket

I've set up my machine with to use a whole set of text editing features from [Turn Your Keyboard into a Text-Editing Rocket](https://medium.com/@caulfieldOwen/turn-your-keyboard-into-a-text-editing-rocket-1514d8474d2d). So I've added Hammerspoon and Karabiner-Elements to the brew task in the shell script. Also a `hyper-apps.lua` file which contains my App shortcuts for Hammerspoon.



## Summary of shortcuts which will be installed

* `l`  - List in long format, include dotfiles
* `ld`-  List in long format, only directories
* `week` -  Get week number
* `open_bash` - Will open the .bash_profile
* `reload_bash_profile` - Refreshes the Bash profile without opening a new Terminal window
* `mk` - Create a new directory and enter it
* `fs` - Determine size of a file or total size of a directory
* `manpdf` - Open a terminal manual page as a PDF - `manpdf ls`
* `updateApps` - Update App Store apps
* `delete_all_downloads` - Deletes all files in `~/Downloads/`
* `empty_trash` - Empties the trash




## Links

* [garystevens - dotfiles](https://github.com/garystevens/dotfiles)

* [using-git-and-github-to-manage-your-dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)


## Caveats

The script has only been partially tested and this is very much a version 1!

Feel free to fork and comment or raise issues.

## Contact

* email: russell@factornine.co.uk
* twitter: @russellf9
