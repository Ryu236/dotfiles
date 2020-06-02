#!/bin/bash

# set up git config script
git config --global alias.b branch
git config --global alias.c checkout
git config --global alias.s status
git config --global alias.alias "!git config --get-regexp '^alias\\.' | sed 's/alias\\.\\([^ ]*\\) \\(.*\\)/\\1\\	 => \\2/' | sort"
git config --global alias.refresh "!git fetch origin && git remote prune origin"
git config --global alias.d1 "diff HEAD~"
git config --global alias.d2 "diff HEAD~2"
git config --global alias.d3 "diff HEAD~3"

# set editor to neovim
git config --global core.editor 'nvim'
