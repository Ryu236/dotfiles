# 補完
# autoload -Uz compinit
# compinit

fpath=(/usr/local/share/zsh-completions $fpath)

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# エイリアス
alias cat='bat'
alias gl='git log --oneline'
alias n='nvim'
alias g='git'
alias grep='grep --color=auto'

## exa variants
alias ls='exa -hlGF'
alias la='exa -abhlF'
alias ll='exa -bhlF'
alias lx='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'

# Other

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# コマンドの改行
bindkey '^J' self-insert

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
#export JAVA_HOME=$(/usr/libexec/java_home -v "11")
#export JAVA_HOME=$(/usr/libexec/java_home -v "13")
export JAVA_HOME=$(/usr/libexec/java_home -v "17")
export PATH=${JAVA_HOME}/bin:${PATH}
export GPG_TTY=$(tty)


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

## zsh plugins

# Plugin history-search-multi-word loaded with investigating.
zi load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zi light zsh-users/zsh-autosuggestions
zi light zdharma-continuum/fast-syntax-highlighting

# Load pure theme
zi ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zi light sindresorhus/pure

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zi ice from"gh-r" as"program"
zi light junegunn/fzf

zinit load agkozak/zsh-z
