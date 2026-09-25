vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/rose-pine/neovim',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require("rose-pine").setup({
    styles = {
        transparency = true,
    },
})

require('lualine').setup {
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diagnostics' },
        lualine_c = { 'branch', 'diff' },
        lualine_x = { 'encoding', 'lsp_status', },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    tabline = {
        lualine_a = {},
        lualine_b = {
            {
                'filetype',
                colored = true,
                icon_only = true,
            },
            {
                'tabs',
                mode = 2,
            },
        },
        lualine_c = {
        },
        lualine_x = {},
        lualine_y = {
            {
                'datetime',
                style = '%d-%m-%y %H:%M'
            }
        },
        lualine_z = {
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
}

vim.cmd.colorscheme("rose-pine");
vim.cmd.set("signcolumn=yes:2")
vim.o.cursorline = true

local bgnone = { bg = "NONE", ctermbg = "NONE" }

vim.api.nvim_set_hl(0, "Normal", bgnone)
vim.api.nvim_set_hl(0, "NormalNC", bgnone)
vim.api.nvim_set_hl(0, "SignColumn", bgnone)
vim.api.nvim_set_hl(0, "EndOfBuffer", bgnone)
