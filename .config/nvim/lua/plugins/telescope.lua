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
        { "<leader>ff", function() require("telescope.builtin").find_files() end },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end },
        { "<leader>fb", function() require("telescope.builtin").buffers() end },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end },
        { "<leader>fts", function() require("telescope.builtin").treesitter() end },
        { "<leader>fmp", function() require("telescope.builtin").man_pages() end },
        { "gd", function() require("telescope.builtin").lsp_definitions() end },
        { "gr", function() require("telescope.builtin").lsp_references() end },
        { "gi", function() require("telescope.builtin").lsp_implementations() end },
        { "go", function() require("telescope.builtin").lsp_type_definitions() end },
        { "<leader>sy", function() require("telescope.builtin").lsp_document_symbols() end },
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
