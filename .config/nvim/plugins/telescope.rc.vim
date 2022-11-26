nnoremap <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> ;s <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <silent> ;g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> ;b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> ;h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <silent> ;; <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <silent> ;e <cmd>lua require('telescope.builtin').diagnostics()<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF

