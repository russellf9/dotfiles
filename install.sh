#!/bin/bash

########## Variables

dir=~/dotfiles                              # dotfiles directory
olddir=~/dotfiles_old                       # old dotfiles backup directory
files="gitconfig bash_profile scripts"      # list of files/directories to move


# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"


# move any existing dotfiles in homedir to dotfiles_old directory
# move files and direcrtories from the dot folder to the home folder
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    echo ~/.$file
    cp  ~/.$file $olddir/.$file
    echo "Moving files and directries to ~"
    cp  $dir/.$file ~/.$file
    echo "...done"
done


# Install Node Package Manager
curl -L https://git.io/n-install | bash

echo "Installing Node"

# will need to `reset` before setting specific version of Node
. ~/.bash_profile

n 6.11.3


# Install Brew to install Applications
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Applications"

brew install 'sql sbt python3'
brew cask install 'firefox google-chrome postman evernote atom webstorm slack zeplin slack sequel-pro'
