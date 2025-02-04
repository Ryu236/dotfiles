-- [[ Basic Keymaps ]]

local opts = { noremap = true, silent = true }

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

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
vim.keymap.set("n", "te", ":tabedit")
vim.keymap.set("n", "<tab>", ":tabnext<Return>", opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- GitHub Copilot
vim.api.nvim_set_keymap('n', '<leader>cc', ':CopilotChat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cs', ':CopilotChatSend<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cq', ':CopilotChatClose<CR>', { noremap = true, silent = true })
