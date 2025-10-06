local builtin = require("telescope.builtin")

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		lazy = true,
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-tree/nvim-web-devicons" },
		},
		keys = {
			{ "<leader>ff", builtin.find_files },
			{ "<leader>fg", builtin.live_grep },
			{ "<leader>fb", builtin.buffers },
			{ "<leader>fh", builtin.help_tags },
			{ "<leader>fr", builtin.lsp_references },
			{ "<leader>fs", builtin.lsp_document_symbols },
			{ "<leader>fts", builtin.treesitter },
			{ "<leader>fi", builtin.lsp_implementations },
			{ "<leader>fmp", builtin.man_pages },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
				extensions = { fzf = {} },
			})

			telescope.load_extension("fzf")
		end,
	},
}
