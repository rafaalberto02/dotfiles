return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		event = "VeryLazy",
		opts = {},
		config = function()
			local configs = require("fzf-lua")

			configs.setup({
				fzf_colors = true,
			})

			vim.api.nvim_set_keymap("n", "<leader>fbf", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
			vim.api.nvim_set_keymap("n", "<leader>fbb", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
			vim.api.nvim_set_keymap("n", "<leader>ff", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
			vim.api.nvim_set_keymap("n", "<leader>fg", [[<Cmd>lua require"fzf-lua".git_files()<CR>]], {})
			vim.api.nvim_set_keymap("n", "<leader>gg", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
			vim.api.nvim_set_keymap("n", "<leader>g", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
			vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})

			configs.utils.info("|<C-\\> buffers|<C-p> files|<C-g> grep|<C-l> live grep|<C-k> builtin|<F1> help|")
		end,
	},
}
