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

vim.o.incsearch = true
vim.o.hlsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 10
vim.o.signcolumn = "yes"

vim.o.encoding = "utf-8"
vim.o.updatetime = 50

vim.o.colorcolumn = "80"

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.ruby_host_prog = "/opt/homebrew/opt/ruby/bin/ruby"
vim.g.perl_host_prog = "/opt/homebrew/bin/perl"
