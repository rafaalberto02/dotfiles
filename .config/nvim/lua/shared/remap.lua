vim.keymap.set("n", "<leader>c", ":nohl<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("x", "<leader>p", [["_dP]], { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { silent = true })

vim.keymap.set('n', '<Leader>y', '"+y', { silent = true })
vim.keymap.set('n', '<Leader>yy', '"+yy', { silent = true })
vim.keymap.set('n', '<Leader>Y', '"+Y', { silent = true })
vim.keymap.set('x', '<Leader>y', '"+y', { silent = true })
vim.keymap.set('x', '<Leader>Y', '"+Y', { silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })

vim.keymap.set('i', '<C-Space>', '<C-n>', { silent = true })
