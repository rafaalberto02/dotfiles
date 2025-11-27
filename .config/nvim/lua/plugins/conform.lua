return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    init = function()
        vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
    end,
    opts = {
        formatters_by_ft = { },
    },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({
                    async = true,
                    lsp_format = "prefer",
                })
            end,
        },
    },
}
