return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        automatic_installation = true,
        automatic_enable = true,
        ensure_installed = {},
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
