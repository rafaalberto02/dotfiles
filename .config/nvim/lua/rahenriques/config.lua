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

vim.o.scrolloff = 10
vim.o.signcolumn = "yes"

vim.o.encoding = "utf-8"
vim.o.updatetime = 50

vim.o.colorcolumn = "80"

vim.o.showmode = false

vim.cmd("colorscheme habamax")

-- transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

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

vim.opt.listchars = { space = "•", tab = "»» " }
vim.opt.list = true
