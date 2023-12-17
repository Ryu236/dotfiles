-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vim.keymap.set('n', '<C-Space>', '<C-w>', {desc = 'Ctrl+Space is the same as Ctrl+w'})
vim.keymap.set('n', 'sh', '<C-w>h', { desc = 'move window left' })
vim.keymap.set('n', 'sj', '<C-w>j', { desc = 'move window down' })
vim.keymap.set('n', 'sk', '<C-w>k', { desc = 'move window up' })
vim.keymap.set('n', 'sl', '<C-w>l', { desc = 'move window right' })
