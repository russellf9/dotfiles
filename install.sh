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

# Java - Install using Brew
# Run `brew cask list` to see if Java was installed by Brew
# Run `java -version` to see if Java is installed
# If Java exists on your system but is not listed by brew cask list
# Uninstall it by following the instructions here: https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html#A1096903

# Install Brew to install Applications
# (Begs the question if Brew was originally installed should it be removed?)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Applications"

# Uncomment if `brew cask list` finds Java
# brew cask uninstall java

brew install 'nvm sql sbt python3 doptopenjdk adoptopenjdk8'
brew cask install 'firefox google-chrome postman evernote atom webstorm slack zeplin slack sequel-pro 1password'

# Now using Node Version Manager rather than n
nvm install 8.10.0
