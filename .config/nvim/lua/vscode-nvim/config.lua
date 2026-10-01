vim.cmd("filetype plugin indent off")
vim.cmd("syntax off")
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.shadafile = "NONE"
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = false
vim.g.clipboard = vim.g.vscode_clipboard

local vscode = require("vscode")
vim.notify = vscode.notify
