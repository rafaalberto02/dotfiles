vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.config/commonrc/scripts/tmux-auto-session.bash<CR>", { silent = true })

vim.keymap.set("n", "<Leader>pv", ":Ex<CR>", { silent = true })

vim.keymap.set('n', '<C-S-Up>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Down>', ':resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Left>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Right>', ':vertical resize +2<CR>', { silent = true })

vim.keymap.set('n', '<C-M-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-M-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-M-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-M-l>', '<C-w>l', { silent = true })

vim.keymap.set('n', '<C-M-Left>', '<C-w>H', { silent = true })
vim.keymap.set('n', '<C-M-Down>', '<C-w>J', { silent = true })
vim.keymap.set('n', '<C-M-Up>', '<C-w>K', { silent = true })
vim.keymap.set('n', '<C-M-Right>', '<C-w>L', { silent = true })

