#!/bin/bash

# Homebrew beer run...

brew update
brew upgrade

# Triple rainbow
brew install grc

# Git it
brew install git

# No doubt about it
brew install node

# Eco-friendly
brew install tree

# Sells Sea Shells
# Note: don’t forget to add `/usr/local/bin/bash` & `/usr/local/bin/zsh`
# to `/etc/shells` before running `chsh -s /usr/local/bin/***`
brew install bash
brew install zsh

# Bring out the barrels
brew install caskroom/cask/brew-cask

# Coffee Buzz
brew cask install keepingyouawake

# Clippy
brew cask install clipmenu

# Quicklook all the things
brew cask install quicklook-json
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install betterzipql
brew cask install webpquicklook

# Throw out bottles
brew cleanup
