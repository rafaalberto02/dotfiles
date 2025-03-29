vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

-- Clear search highlighting with <leader> and c
vim.keymap.set("n", "<leader>c", ":nohl<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Remove arrows
vim.keymap.set('n','<Leader>y','"+y')
vim.keymap.set('n','<Leader>yy','"+yy')
vim.keymap.set('n','<Leader>Y','"+Y')
vim.keymap.set('x','<Leader>y','"+y')
vim.keymap.set('x','<Leader>Y','"+Y')

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-auto-session<CR>")

vim.keymap.set('i', '<Down>', '<NOP>')
vim.keymap.set('i', '<Left>', '<NOP>')
vim.keymap.set('i', '<Right>', '<NOP>')
vim.keymap.set('i', '<Up>', '<NOP>')

vim.keymap.set('n', '<Down>', '<NOP>')
vim.keymap.set('n', '<Left>', '<NOP>')
vim.keymap.set('n', '<Right>', '<NOP>')
vim.keymap.set('n', '<Up>', '<NOP>')

vim.keymap.set('v', '<Down>', '<NOP>')
vim.keymap.set('v', '<Left>', '<NOP>')
vim.keymap.set('v', '<Up>', '<NOP>')
vim.keymap.set('v', '<Right>', '<NOP>')
