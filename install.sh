#!/bin/bash

set -eu
DOT_DIRECTORY="${HOME}/dotfiles"

for f in .??*
do 
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
  ln -snfv ${DOT_DIRECTORY}/.config/nvim ${HOME}/.config/
  ln -snfv ${DOT_DIRECTORY}/.config/alacritty ${HOME}/.config/
  echo "$f"
done
