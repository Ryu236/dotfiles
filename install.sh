#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/dotfiles"

for f in .??*
do 
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  ln -snfv ${dot_directory}/${f} ${home}/${f}
  ln -snfv ${dot_directory}/Brewfile ${home}/Brewfile
  echo "$f"
done
