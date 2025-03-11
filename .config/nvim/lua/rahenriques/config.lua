vim.o.guicursor = ""

vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.termguicolors = true

vim.o.scrolloff = 10
vim.o.signcolumn = "yes"

vim.o.encoding = "utf-8"
vim.o.updatetime = 50

vim.o.colorcolumn = "80"

-- transparent background
vim.cmd("colorscheme habamax")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.g.editorconfig = true

-- Set Netrw options
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
