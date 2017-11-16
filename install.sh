#!/bin/bash

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory


# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"


# moving files...

# .bash_profile

cp $dir/runcom/.bash_profile ~/.bash_profile
echo "...done"
