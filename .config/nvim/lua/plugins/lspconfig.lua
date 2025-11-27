return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp"
    },
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        vim.opt.signcolumn = "yes"
    end,
    config = function()
        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        local blink = require("blink.cmp")

        local capabilities = blink.get_lsp_capabilities()

        vim.lsp.config("*", {
            capabilities = capabilities,
        })
    end,
}
