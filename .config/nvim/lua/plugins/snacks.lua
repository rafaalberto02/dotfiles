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
        },
    },
})

vim.keymap.set("n", "<leader>ff", function() snacks.picker.files() end)
vim.keymap.set("n", "<leader>fg", function() snacks.picker.grep() end)
vim.keymap.set("n", "<leader>fb", function() snacks.picker.buffers() end)

vim.keymap.set("n", "<leader>fzf", function() snacks.picker() end)

vim.keymap.set("n", "gd", function() snacks.picker.lsp_definitions() end)
vim.keymap.set("n", "gr", function() snacks.picker.lsp_references() end)
vim.keymap.set("n", "gi", function() snacks.picker.lsp_implementations() end)
vim.keymap.set("n", "sy", function() snacks.picker.lsp_symbols() end)
vim.keymap.set("n", "tsy", function() snacks.picker.treesitter() end)

vim.keymap.set("n", "<leader>xx", function() snacks.picker.diagnostics() end)
vim.keymap.set("n", "<leader>xX", function() snacks.picker.diagnostics_buffer() end)
