return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "nvim-telescope/telescope.nvim" },
        { "saghen/blink.cmp" },
    },
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        vim.opt.signcolumn = "yes"
    end,
    config = function()
        local telescope = require("telescope.builtin")
        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "gd", telescope.lsp_definitions)
        vim.keymap.set("n", "gr", telescope.lsp_references)
        vim.keymap.set("n", "gi", telescope.lsp_implementations)
        vim.keymap.set("n", "go", telescope.lsp_type_definitions)
        vim.keymap.set("n", "<leader>sy", telescope.lsp_document_symbols)

        local blink = require("blink.cmp")

        local capabilities = blink.get_lsp_capabilities()

        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        -- vim.lsp.enable("ccls")
    end,
}
