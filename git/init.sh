#!/bin/bash

# Set up to Git er goin!

# Git er goin
if ! [[ -f $DOT_ROOT/git/gitconfig.symlink ]];
then
  question 'First, what is your github user name?'
  read -e git_user_name
  question 'Thanks! Now, what is your github user email?'
  read -e git_user_email
  sed -e "s/USER_NAME/$git_user_name/g" -e "s/USER_EMAIL/$git_user_email/g" $DOT_ROOT/git/gitconfig.symlink.template > $DOT_ROOT/git/gitconfig.symlink
else
  working 'Edit gitconfig.symlink if config changes desired'
fi

success 'Looks like your gitconfig is all set...'

# Create SSH key for github because fancy
PUB_KEY=$HOME/.ssh/id_rsa.pub
message 'Checking for SSH key, generating one if it does not exist...'
if ! [[ -f $PUB_KEY ]];
then
  [[ -f $PUB_KEY ]] || ssh-keygen -t rsa
  # Copy and open github SSH page because extra fancy
  message 'Copying public key to clipboard. Paste it into your Github account...'
  [[ -f $PUB_KEY ]] && cat $PUB_KEY | pbcopy
  open 'https://github.com/account/ssh'
fi
