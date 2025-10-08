return {
    "mfussenegger/nvim-lint",
    event = "LspAttach",
    enabled = function()
        local filetypes = { "markdown" }
        return vim.tbl_contains(filetypes, vim.bo.filetype)
    end,
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            markdown = { "vale" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
