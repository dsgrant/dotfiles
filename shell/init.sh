#!/bin/bash

HOMEBREW_PREFIX="$(brew --prefix)"
BASHPATH="$HOMEBREW_PREFIX/bin/bash"
ZSHPATH="$HOMEBREW_PREFIX/bin/zsh"

if [ -z "$(cat /etc/shells | grep "$HOMEBREW_PREFIX")" ];
then
  sudo sh -c "printf \"$BASHPATH\n$ZSHPATH\n\" >> /etc/shells"
fi

# Bash 4 set as default
chsh -s $BASHPATH

working "Now using homebrew bash & zsh. Default set to Bash."
