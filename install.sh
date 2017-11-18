#!/bin/bash

########## Variables

dir=~/dotfiles                     # dotfiles directory
olddir=~/dotfiles_old              # old dotfiles backup directory
files="gitconfig bash_profile script"     # list of files to symlink


# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"



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
=======

# .bash_profile

cp $dir/runcom/.bash_profile ~/.bash_profile
>>>>>>> f1c7c6d1c036e8793afd3be99d1e6493a76f0af6
echo "...done"
