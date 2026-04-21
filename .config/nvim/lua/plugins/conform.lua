vim.pack.add({
    { src = 'https://github.com/stevearc/conform.nvim' },
})

require("conform").setup({
    formatters_by_ft = {},
    default_format_opts = {
        lsp_format = "fallback",
    },
})

vim.keymap.set("n", "<leader>f", function() require("conform").format({ async = true }) end)
