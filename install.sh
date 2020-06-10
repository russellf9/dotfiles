#!/bin/bash

########## Variables

dir=~/dotfiles                              # dotfiles directory
olddir=~/dotfiles_old                       # old dotfiles backup directory
files="gitconfig hammerspoon vim vimrc bash_profile zshrc"      # list of files/directories to move


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

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update


# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install gnu-grep --with-default-names

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4 (I've added this from the [codeinthehole](https://gist.github.com/codeinthehole/osx_bootstrap.sh) repo and I'm not 100% sure it's required)
brew install bash


PACKAGES=(
    docker
    hammerspoon
    iterm2
    karabiner
    karabiner-elements
    visual-studio-code
    vlc
    zoom
    zsh
)
echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
    1password
    atom
    evernote
    firefox
    google-chrome
    postman
    slack
    zeplin
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing NVM"
# Now using Node Version Manager rather than n (I'm not 100% that we don't have to cd to another directory)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash


echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended