set -gx TERM xterm-256color

# aliases
alias ll "exa -l -g --icons"
alias la "ll -a"
alias vim "nvim"
alias g "git"
alias cat "bat"
alias gl "git log --oneline"

set -gx EDITOR nvim

set -xU PATH $HOME/flutter/bin:$PATH
set -xU PATH $HOME/.rbenv/bin:$PATH
eval $(rbenv init - | source)
set -U nvm_default_version v16.14.0
set -xU ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -xU PATH $ANDROID_SDK_ROOT/emulator
set -xU PATH $ANDROID_SDK_ROOT/platform-tools
set -x JAVA_HOME $(/usr/libexec/java_home -v "11")
set -xU ANDROID_HOME $HOME/Library/Android/sdk
set -xU PATH $PATH:$ANDROID_HOME/tools
set -xU PATH $PATH:$ANDROID_HOME/tools/bin
set -xU PATH $PATH:$ANDROID_HOME/platform-tools
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
