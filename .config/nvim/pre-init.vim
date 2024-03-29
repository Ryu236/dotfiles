" python3 のPath指定
let g:python3_host_prog = '~/.pyenv/shims/python3'
let g:python_host_prog = '~/.pyenv/shims/python'

" FYI : https://github.com/Shougo/shougo-s-github/tree/master/vim/rc
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:dein_toml = '~/.config/nvim/dein.toml'
let s:dein_lazy_toml = '~/.config/nvim/deinlazy.toml'

if &compatible
  set nocompatible
endif

" automatic installation of dein.vim
if !isdirectory(s:dein_repo_dir)
  execute '!git clone <https://github.com/Shougo/dein.vim>' s:dein_repo_dir
endif
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
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

" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

let mapleader = "\<Space>"

filetype plugin indent on
syntax enable

" color theme setting
set termguicolors
" set background=dark
" colorscheme duo-mini
"colorscheme iceberg

" vim-airline setting
let g:airline_theme = 'simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#coc#enabled = 1
"let airline#extensions#coc#error_symbol = 'E:'
"let airline#extensions#coc#warning_symbol = 'W:'
"let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" coc-prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc-snippets
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? coc#_select_confirm() :
"  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ coc#refresh()
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" let g:coc_snippet_next = '<tab>'

" emmet-vim
let g:user_emmet_mode='a'    "enable all function in all mode.

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" ペースト時に末尾に移動
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" terminal mode
" enter insert mode when enter a terminal buffer
autocmd TermOpen term://* startinsert
" Lunch tig in terminal mode
nnoremap <Leader>t :terminal tig status<CR>

" 見た目系
" 行番号を表示
" set number
" 現在の行を強調表示
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" コマンドラインの高さ
set cmdheight=1

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list
set listchars=tab:\▸\-,trail:･,extends:>,precedes:<,nbsp:%
"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" ESC & save changes
nnoremap <Leader>s <Esc>:w<CR>

" coc-yank command
" nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Split window
nnoremap ss :split<Return><C-w>w
nnoremap sv :vsplit<Return><C-w>w

" Move window
nnoremap <Space> <C-w>w
noremap s<left> <C-w>h
noremap s<up> <C-w>k
noremap s<down> <C-w>j
noremap s<right> <C-w>l
noremap sh <C-W>h
noremap sk <C-w>k
noremap sj <C-w>j
noremap sl <C-w>l

" Move buffers
nnoremap gb :bn<CR>
nnoremap gp :bp<CR>

" Resize window
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-

" Switch tab
nnoremap st :tabnew<Return>
nnoremap <Tab> :tabnext<Return>
nnoremap <S-tab> :tabprev<Return>

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %
