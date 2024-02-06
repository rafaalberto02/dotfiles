vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.encoding = "utf-8"
vim.o.updatetime = 300

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.ruby_host_prog = "/opt/homebrew/opt/ruby/bin/ruby"
vim.g.perl_host_prog = "/opt/homebrew/bin/perl"
