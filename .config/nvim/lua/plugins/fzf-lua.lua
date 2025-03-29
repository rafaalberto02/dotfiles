return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		event = "VeryLazy",
		opts = {},
		config = function()
			local fzf_lua = require("fzf-lua")

			fzf_lua.setup({
				fzf_colors = true,
			})

			vim.keymap.set("n", "<leader>fb", fzf_lua.buffers, {})
			vim.keymap.set("n", "<leader>fbi", fzf_lua.builtin, {})
			vim.keymap.set("n", "<leader>ff", fzf_lua.files, {})
			vim.keymap.set("n", "<leader>fg", fzf_lua.git_files, {})
			vim.keymap.set("n", "<leader>gg", fzf_lua.live_grep_glob, {})
			vim.keymap.set("n", "<leader>g", fzf_lua.grep_project, {})
			vim.keymap.set("n", "<F1>", fzf_lua.help_tags, {})
		end,
	},
}
