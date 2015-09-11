#!/bin/bash

# Bash and Grab

# If no bash_local, create one

if ! [[ -f $DOT_ROOT/bash/bash_local.symlink ]];
then
  cp $DOT_ROOT/bash/bash_local.symlink.template $DOT_ROOT/bash/bash_local.symlink
else
  working 'Edit bash_local.symlink if local bash changes desired'
fi
