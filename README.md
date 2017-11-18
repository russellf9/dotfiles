# dotfiles
My personal OSX installation system.

## Description

I was reading [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) and was inspired to create a configuration that would automate the setting up of a new OSX machine.

I wanted to learn from the ground up so I simplified the process outlined by Lars Kappert copying files and directories rather than adding the sym links.

My simpler structure has a `.bash_profile` which contains the functions and alias rather than them being in separate files.

Using [brew](https://brew.sh/) and [n-install](https://github.com/mklement0/n-install#n-install-&mdash-introduction) to install [n (Node Version Manager](https://www.npmjs.com/package/n) I managed to get the installation script down to just a few lines.


## Installation

Run the following commands and respond to prompts.

```
cd ~

# This will also install git

xcode-select --install

git checkout https://github.com/russellf9/dotfiles.git

cd dotfile

sh install.sh

```


## Webstorm Settings

I'm using [Settings Repository](https://plugins.jetbrains.com/plugin/7566-settings-repository) to save my Webstorm configuration across my home and work machines and this is working well so far.


## Links

* [garystevens - dotfiles](https://github.com/garystevens/dotfiles)

* [using-git-and-github-to-manage-your-dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)


## Caveats

The script has only been partially tested and this is very much a version 1!
Feel free to fork and comment or raise issues.

## Contact

email: russell@factornine.co.uk
twitter: @russellf9
