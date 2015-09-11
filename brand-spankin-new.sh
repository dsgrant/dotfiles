#!/bin/bash

# Set up a brand spankin' new OSX dev environment.

# Development folder to keep things tidy
DEV_ROOT="$HOME/Development"
DOT_ROOT="$DEV_ROOT/dotfiles"

if ! [[ -d "$DOT_ROOT" ]];
then
  message "$DOT_ROOT does not exist. Rename directories or edit command and retry..."
  exit 1
fi

message () {
  printf "\n\033[0;33m⊚ $1\033[0m\n"
}
working () {
  printf "\n\033[0;36m⋇ $1\033[0m\n"
}
question () {
  printf "\n\033[0;35m⊛ $1\033[0m\n"
}
success () {
  printf "\n\033[0;32m◬ $1\033[0m\n"
}

message 'Checking for Xcode...'
  if ! xcode-select -p &> /dev/null;
  then
    xcode-select --install &> /dev/null
    while ! xcode-select -p &> /dev/null;
    do
      sleep 5
    done
    sudo xcodebuild -license
  fi

# Install Homebrew and make a beer run
question 'Do you want to install/update brew settings? (y/n)'
  read -n 1
  printf '\n'
if [[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1;
then
  message 'Setting up Homebrew...'
    if test ! $(which brew);
    then
      working "Installing Homebrew for you."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    working "Beer run!"
    source 'homebrew/init.sh'
fi

# Git er goin
# OSX
question 'Do you want to update git settings? (y/n)'
  read -n 1
  printf '\n'
if [[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1;
then
  message 'Setting up git...'
    source 'git/init.sh'
fi

# OSX
question 'Do you want to update osx settings? (y/n)'
  read -n 1
  printf '\n'
if [[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1;
then
  message 'Setting up osx...'
    source 'osx/init.sh'
fi

# BASH
question 'Do you want to update bash settings? (y/n)'
  read -n 1
  printf '\n'
if [[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1;
then
  message 'Setting up bash...'
    source 'bash/init.sh'
fi

# SHELL
question 'Do you want to update shell settings? (y/n)'
  read -n 1
  printf '\n'
if [[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1;
then
  message 'Setting up shell...'
    source 'shell/init.sh'
fi

# Symlinks
question 'Do you want to update symlinks? (y/n)'
  read -n 1
  printf '\n'
if [[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1;
then
  message 'Setting up symlinks...'
    source 'symlink/init.sh'
fi

# TODOS
success 'Success! Restarting machine will assure changes are applied.'

question 'Do you want to restart now? (y/n)'
  read -n 1
  printf '\n'
if [[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1;
then
  sudo shutdown -r now &> /dev/null
fi
