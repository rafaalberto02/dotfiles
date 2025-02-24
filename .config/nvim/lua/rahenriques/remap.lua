vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Clear search highlighting with <leader> and c
vim.keymap.set("n", "<leader>c", ":nohl<CR>")

vim.keymap.set('n','<Leader>y','"+y')
vim.keymap.set('n','<Leader>yy','"+yy')
vim.keymap.set('n','<Leader>Y','"+Y')
vim.keymap.set('x','<Leader>y','"+y')
vim.keymap.set('x','<Leader>Y','"+Y')
