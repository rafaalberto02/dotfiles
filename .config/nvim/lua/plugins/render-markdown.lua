return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
        lazy = true,
        command = "Md",
		opts = {},
		config = function()
			local configs = require("render-markdown")

			configs.setup({
				completions = { lsp = { enabled = true } },
				latex = { enabled = false },
			})
		end,
	},
}
