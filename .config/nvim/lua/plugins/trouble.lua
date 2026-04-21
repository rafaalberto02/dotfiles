vim.pack.add({
    { src = 'https://github.com/folke/trouble.nvim' }
})

require("trouble").setup({
    auto_close = true,
    auto_open = false,
    auto_preview = true,
    auto_refresh = true,
    auto_jump = false,
    focus = false,
    restore = true,
    follow = true,
    indent_guides = true,
    max_items = 20,
    multiline = false,
    pinned = false,
    warn_no_results = true,
    open_no_results = false,
    win = {},
    preview = {
        type = "main",
        scratch = true,
    },
    modes = {
        preview_float = {
            mode = "diagnostics",
            preview = {
                type = "float",
                relative = "editor",
                border = "rounded",
                title = "Preview",
                title_pos = "center",
                position = { 0, -2 },
                size = { width = 0.3, height = 0.3 },
                zindex = 200,
            },
        },
    },

});

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>xx", function() vim.cmd('Trouble diagnostics toggle') end, opts)
vim.keymap.set("n", "<leader>xX", function() vim.cmd('Trouble diagnostics toggle filter.buf=0') end, opts)

local config = require("fzf-lua.config")
local actions = require("trouble.sources.fzf").actions

config.defaults.actions.files["ctrl-t"] = actions.open
