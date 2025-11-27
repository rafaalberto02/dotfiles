vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>c", ":nohl<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>yy', '"+yy')
vim.keymap.set('n', '<Leader>Y', '"+Y')
vim.keymap.set('x', '<Leader>y', '"+y')
vim.keymap.set('x', '<Leader>Y', '"+Y')

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-auto-session<CR>")
