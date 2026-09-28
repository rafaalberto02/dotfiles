vim.keymap.set("x", "<leader>p", [["_dP]], { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { silent = true })

vim.keymap.set('n', '<Leader>y', '"+y', { silent = true })
vim.keymap.set('n', '<Leader>yy', '"+yy', { silent = true })
vim.keymap.set('n', '<Leader>Y', '"+Y', { silent = true })
vim.keymap.set('x', '<Leader>y', '"+y', { silent = true })
vim.keymap.set('x', '<Leader>Y', '"+Y', { silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

vim.keymap.set('i', '<C-Space>', '<C-n>', { silent = true })
