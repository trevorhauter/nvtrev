-- Define keybindings for NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTree<CR>', { noremap = true, silent = true })

-- NERDTree configuration
vim.g.NERDTreeIgnore = { '.git', 'node_modules', '.DS_Store' } -- Customize ignored files/folders

