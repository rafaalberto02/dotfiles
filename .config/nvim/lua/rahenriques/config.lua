vim.o.guicursor = ""

vim.o.hlsearch = false
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

vim.o.encoding = "utf-8"
vim.o.updatetime = 50

vim.cmd("colorscheme retrobox")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

vim.g.editorconfig = true

-- Set Netrw options
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1

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

vim.keymap.set("n", "<space>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)

vim.opt.listchars = { space = "•", tab = "»» " }
vim.opt.list = false
