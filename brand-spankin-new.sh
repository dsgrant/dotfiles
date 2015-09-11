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
ask_to_proceed() {
  question "$1 (y/n) "
  read -n 1
  printf "\n"
}
reply_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
      && return 0 \
      || return 1
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
ask_to_proceed 'Do you want to install/update brew settings?'
printf '\n'
if reply_yes;
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
ask_to_proceed 'Do you want to update git settings?'
printf '\n'
if reply_yes;
then
  message 'Setting up git...'
    source 'git/init.sh'
fi

# OSX
ask_to_proceed 'Do you want to update osx settings?'
printf '\n'
if reply_yes;
then
  message 'Setting up osx...'
    source 'osx/init.sh'
fi

# BASH
ask_to_proceed 'Do you want to update bash settings?'
printf '\n'
if reply_yes;
then
  message 'Setting up bash...'
    source 'bash/init.sh'
fi

# SHELL
ask_to_proceed 'Do you want to update shell settings?'
printf '\n'
if reply_yes;
then
  message 'Setting up shell...'
    source 'shell/init.sh'
fi

# Symlinks
ask_to_proceed 'Do you want to update symlinks?'
printf '\n'
if reply_yes;
then
  message 'Setting up symlinks...'
    source 'symlink/init.sh'
fi

# TODOS
success 'Success! Restarting machine will assure changes are applied.'

ask_to_proceed 'Do you want to restart now?'
printf '\n'
if reply_yes;
then
  sudo shutdown -r now &> /dev/null
fi
