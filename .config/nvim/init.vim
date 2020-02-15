" python3 のPath指定
let g:python3_host_prog = '~/.pyenv/shims/python3'

" FYI : https://github.com/Shougo/shougo-s-github/tree/master/vim/rc
let s:dein_toml = '~/.config/nvim/dein.toml'
let s:dein_lazy_toml = '~/.config/nvim/deinlazy.toml'

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  " dein.tomlを起動時ロードの設定ファイルとして読み込む
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" NeoVim 起動時に dein.toml ファイルをチェックし、未インストールのプラグインがあった場合インストールする
if dein#check_install()
  call dein#install()
endif


filetype plugin indent on
syntax enable

set fenc=utf-8         "文字コードをUTF-8に設定"
set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set cursorline
set virtualedit=onemore
set showmatch
set smartindent
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
set list listchars=tab:\▸\-
set wrapscan
set hlsearch
set incsearch
set smartcase

