return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    init = function()
        vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
    end,
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort" },
            rust = { "rustfmt" },
            javascript = { "biome" },
            typescript = { "biome" },
            json = { "biome" },
            html = { "prettierd" },
            css = { "prettierd" },
            zsh = { "beautysh" },
            cs = { "csharpier" },
            c = { "clang-format" },
            vala = { "uncrustify" },
        },
    },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({
                    async = true,
                    callback = function()
                        vim.lsp.buf.format({ async = true })
                    end,
                })
            end,
        },
    },
}
