local builtin = require("telescope.builtin")

return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>ff", builtin.find_files },
        { "<leader>fg", builtin.live_grep },
        { "<leader>fb", builtin.buffers },
        { "<leader>fh", builtin.help_tags },
        { "<leader>fts", builtin.treesitter },
        { "<leader>fmp", builtin.man_pages },
        { "gd", builtin.lsp_definitions },
        { "gr", builtin.lsp_references },
        { "gi", builtin.lsp_implementations },
        { "go", builtin.lsp_type_definitions },
        { "<leader>sy", builtin.lsp_document_symbols },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                "node_modules/",
                "build/",
                "obj/",
                "bin/",
                ".git/",
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "ignore_case",
            },
        },
    },
    config = function()
        local telescope = require("telescope")

        telescope.load_extension("fzf")
    end,
}
