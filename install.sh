#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/dotfiles"
# DOT_CONFIG_DIRECTORY=".config"

cd ${DOT_CONFIG_DIRECTORY}

for f in .??*
do 
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue
	ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
	echo "$f"
done
