vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

-- Clear search highlighting with <leader> and c
vim.keymap.set("n", "<leader>c", ":nohl<CR>")

vim.keymap.set('n','<Leader>y','"+y')
vim.keymap.set('n','<Leader>yy','"+yy')
vim.keymap.set('n','<Leader>Y','"+Y')
vim.keymap.set('x','<Leader>y','"+y')
vim.keymap.set('x','<Leader>Y','"+Y')

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-auto-session<CR>")
