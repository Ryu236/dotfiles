#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/dotfiles"

for f in .??*
do 
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue
	ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
	echo "$f"
done
