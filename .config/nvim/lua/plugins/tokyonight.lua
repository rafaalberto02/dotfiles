return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "night",
        transparent = true,
        plugins = {
            auto = true,
        },
    },
    init = function()
        vim.cmd([[colorscheme tokyonight-night]])
    end,
}
