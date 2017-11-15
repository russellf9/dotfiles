#!/bin/bash

########## Variables

dir=~/dotfiles                     # dotfiles directory
olddir=~/dotfiles_old              # old dotfiles backup directory
files="gitconfig bash_profile"     # list of files to symlink


# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"


# moving files...
# move any existing dotfiles in homedir to dotfiles_old directory
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    echo ~/.$file
    cp  ~/.$file $olddir/.$file
    echo "...done"
done


# Simply Copy the .bash_profile and gitconfig over
echo "Moving files to home directory"
    cp $dir/runcom/.bash_profile ~/.bash_profile
    cp $dir/git/.gitconfig ~/.gitconfig
echo "...done"
