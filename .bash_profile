if [ -f ~/.bashrc ]; then
      . ~/.bashrc
    fi
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
