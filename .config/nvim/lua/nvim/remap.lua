vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.config/commonrc/scripts/tmux-auto-session.bash<CR>", { silent = true })

vim.keymap.set("n", "<Leader>pv", ":Ex<CR>", { silent = true })

vim.keymap.set('n', '<C-M-h>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-M-j>', ':resize -2<CR>', { silent = true })
vim.keymap.set('n', '<C-M-k>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<C-M-l>', ':vertical resize +2<CR>', { silent = true })

vim.keymap.set('n', '<C-S-h>', '<C-w>H', { silent = true })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { silent = true })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { silent = true })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

vim.keymap.set('n', '<leader>rr', vim.cmd.restart, { silent = true })
