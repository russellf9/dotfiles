#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install brew if not already installed
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# Install Brew Cask packages

apps="google-chrome firefox slack evernote atom webstorm charles postman"

for app in $apps; do
    echo "Installing $app"
    brew cask install $app
done




