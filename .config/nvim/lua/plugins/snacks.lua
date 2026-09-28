vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
})

local snacks = require("snacks")

snacks.setup({
    picker = {
        enabled = true,
        live = true,
        win = {
            input = {
                bo = {
                    autocomplete = false,
                },
            },
        },
        sources = {
            files = { hidden = true },
            grep = { hidden = true },
            explorer = { hidden = true },
            smart = { hidden = true },
            lsp_definitions = {
                auto_confirm = true,
            },
        },
    },
})

local lsp_opts = {
    auto_confirm = true,
}

vim.keymap.set("n", "<leader>ff", function() snacks.picker.files() end)
vim.keymap.set("n", "<leader>fg", function() snacks.picker.grep() end)
vim.keymap.set("n", "<leader>fb", function() snacks.picker.buffers() end)

vim.keymap.set("n", "<leader>fzf", function() snacks.picker() end)

vim.keymap.set("n", "gd", function() snacks.picker.lsp_definitions(lsp_opts) end)
vim.keymap.set("n", "gr", function() snacks.picker.lsp_references(lsp_opts) end)
vim.keymap.set("n", "gi", function() snacks.picker.lsp_implementations(lsp_opts) end)
vim.keymap.set("n", "sy", function() snacks.picker.lsp_symbols(lsp_opts) end)
vim.keymap.set("n", "tsy", function() snacks.picker.treesitter() end)

vim.keymap.set("n", "<leader>xx", function() snacks.picker.diagnostics() end)
vim.keymap.set("n", "<leader>xX", function() snacks.picker.diagnostics_buffer() end)
