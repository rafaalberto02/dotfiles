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
        local blink = require("blink.cmp")

        local capabilities = blink.get_lsp_capabilities()

        local on_attach = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

            local telescope = require("telescope.builtin")

            vim.keymap.set("n", "gd", telescope.lsp_definitions)
            vim.keymap.set("n", "gr", telescope.lsp_references)
            vim.keymap.set("n", "gi", telescope.lsp_implementations)
            vim.keymap.set("n", "go", telescope.lsp_type_definitions)
            vim.keymap.set("n", "<leader>p", telescope.lsp_document_symbols)
        end

        vim.lsp.config('*', {
            capabilities = capabilities,
            on_attach = on_attach
        })

        vim.lsp.config("vala_ls", {
            cmd = { "vala-language-server" },
            filetypes = { "vala", "genie" },
            single_file_support = true,
        })

        vim.lsp.enable("vala_ls")
    end,
}
