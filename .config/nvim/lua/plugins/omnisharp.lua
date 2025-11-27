return {
    "Hoffs/omnisharp-extended-lsp.nvim",
    lazy = true,
    ft = "cs",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "omnisharp" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    config = function()
        local omnisharp = require("omnisharp_extended")

        vim.lsp.config("omnisharp", {
            on_attach = function(_, _)
                vim.keymap.set("n", "gd", omnisharp.telescope_lsp_definitions)
                vim.keymap.set("n", "gr", omnisharp.telescope_lsp_references)
                vim.keymap.set("n", "gi", omnisharp.telescope_lsp_implementation)
                vim.keymap.set("n", "go", omnisharp.telescope_lsp_type_definition)
            end,
        })
    end
}
