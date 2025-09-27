return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "nvim-telescope/telescope.nvim" },
        { "saghen/blink.cmp" },
        { "williamboman/mason-lspconfig.nvim" },
        { "stevearc/conform.nvim" },
        { "mfussenegger/nvim-lint" },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    { path = "lazy.nvim", words = { "LazyVim" } },
                },
            },
        },
    },
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    init = function()
        vim.opt.signcolumn = "yes"
    end,
    config = function()
        local lsp = require("lspconfig")
        local blink = require("blink.cmp")

        local lsp_defaults = lsp.util.default_config
        local vim_capabilities = vim.lsp.protocol.make_client_capabilities()

        local capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, vim_capabilities)

        capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities({}, false))

        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {},
            handlers = {
                function(server_name)
                    lsp[server_name].setup({ capabilities = capabilities })
                end,

                ["jsonls"] = function()
                    lsp.jsonls.setup({
                        capabilities = capabilities,
                        settings = {
                            json = {
                                schemas = {
                                    {
                                        fileMatch = { "package.json" },
                                        url = "https://json.schemastore.org/package.json",
                                    },
                                },
                            },
                        },
                    })
                end,

                ["ansiblels"] = function()
                    lsp.ansiblels.setup({
                        capabilities = capabilities,
                        cmd = { "ansible-language-server", "--stdio" },
                        settings = {
                            ansible = {
                                python = { interpreterPath = "python" },
                                ansible = { path = "ansible" },
                                executionEnvironment = { enabled = false },
                                validation = {
                                    enabled = false,
                                    lint = { enabled = true, path = "ansible-lint" },
                                },
                            },
                        },
                        filetypes = { "yaml", "yml", "ansible" },
                        root_dir = lsp.util.root_pattern("roles", "playbooks"),
                        single_file_support = false,
                    })
                end,
            },
        })

        require("lspconfig").vala_ls.setup({
            cmd = { "vala-language-server" },
            filetypes = { "vala", "genie" },
            root_dir = lsp.util.root_pattern("meson.build", ".git"),
            single_file_support = true,
        })

        require("lint").linters_by_ft = {
            markdown = { "vale" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                --vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                --vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                --vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                --vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                local telescope = require("telescope.builtin")

                vim.keymap.set("n", "gd", telescope.lsp_definitions)
                vim.keymap.set("n", "gr", telescope.lsp_references)
                vim.keymap.set("n", "gi", telescope.lsp_implementations)
                vim.keymap.set("n", "go", telescope.lsp_type_definitions)
                vim.keymap.set("n", "<leader>p", telescope.lsp_document_symbols)

                vim.keymap.set("n", "<leader>f", function()
                    require("conform").format({
                        async = true,
                        callback = function(_, did_edit)
                            if did_edit == false then
                                local client = vim.lsp.get_client_by_id(event.data.client_id)

                                if client and client.supports_method("textDocument/formatting") then
                                    vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
                                end
                            end
                        end,
                    })
                end, opts)
            end,
        })
    end,
}
