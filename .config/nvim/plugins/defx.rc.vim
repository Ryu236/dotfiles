" 【sf】 defx.nvimを起動
" nnoremap sf :<C-u>Defx<CR>

call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'show_ignored_files': 1,
	\ })

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

autocmd fileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
          \ defx#async_action('open')
    nnoremap <silent><buffer><expr> l
          \ defx#async_action('open')
    nnoremap <silent><buffer><expr> h
          \ defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> j
          \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
          \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> q
          \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> m
          \ defx#do_action('move')
  endfunction
