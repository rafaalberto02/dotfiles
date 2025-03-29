return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	init = function()
		vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
	end,
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort" },
				rust = { "rustfmt" },
				javascript = { "biome" },
				typescript = { "biome" },
				json = { "biome" },
				html = { "prettierd" },
				css = { "prettierd" },
				zsh = { "beautysh" },
				cs = { "csharpier" },
				c = { "clang-format" },
			},
		})
	end,
}
