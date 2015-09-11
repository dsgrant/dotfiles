#!/bin/bash

# Symlink all things

if ! [[ -d "$DOT_ROOT" ]];
then
  message "$DOT_ROOT does not exist. Closing."
  exit 1
fi

link() {
  from="$1"
  to="$2"
  working "Now moving '$from' to '$to'..."
  rm -f "$to"
  ln -s "$from" "$to"
}

for src in $(find -H "$DOT_ROOT" -maxdepth 2 -name '*.symlink'); do
  dst="$HOME/.$(basename "${src%.*}")"
  link "$src" "$dst"
done

success "Dotfiles successfully linked..."
