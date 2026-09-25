vim.g.have_nerd_font = true
vim.g.editorconfig = true
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 0

vim.o.guicursor = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'

vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
        vim.wo.signcolumn = 'yes'
        vim.wo.scrolloff = 10
    end,
})

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
vim.o.encoding = "UTF-8"
vim.o.updatetime = 50

vim.opt.equalalways = false

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

vim.opt.listchars = {
    tab = '→ ',
    trail = '·',
    extends = '>',
    precedes = '<',
    nbsp = '␣',
    space = '␣'
}

vim.opt.list = false
