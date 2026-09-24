vim.pack.add({
    { src = 'https://github.com/rose-pine/neovim' },
})

require("rose-pine").setup({
    styles = {
        transparency = true,
    },
})

vim.o.cursorline = true

vim.cmd.colorscheme("rose-pine");
vim.cmd.set("signcolumn=yes:2")

local bgnone = { bg = "NONE", ctermbg = "NONE" }

vim.api.nvim_set_hl(0, "Normal", bgnone)
vim.api.nvim_set_hl(0, "NormalNC", bgnone)
vim.api.nvim_set_hl(0, "SignColumn", bgnone)
vim.api.nvim_set_hl(0, "EndOfBuffer", bgnone)

-- local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })
-- if cursorline.bg then
--     vim.api.nvim_set_hl(0, "StatusLine", { bg = cursorline.bg, fg = cursorline.fg })
--     vim.api.nvim_set_hl(0, "StatusLineNC", { bg = cursorline.bg, fg = cursorline.fg })
-- end

require("plugins.statusline")
