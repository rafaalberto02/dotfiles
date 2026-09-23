vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim' }
})

require("rose-pine").setup({
    styles = {
        transparency = true,
    },
})

vim.cmd.colorscheme("rose-pine");

vim.cmd.set("signcolumn=yes:2")

vim.cmd.hi("Normal guibg=NONE ctermbg=NONE")
vim.cmd.hi("SignColumn guibg=NONE ctermbg=NONE")
vim.cmd.hi("NormalNC guibg=NONE ctermbg=NONE")
vim.cmd.hi("EndOfBuffer guibg=NONE ctermbg=NONE")

vim.o.cursorline = true
