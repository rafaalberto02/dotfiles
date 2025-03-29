return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
	lazy = false,
	opts = {},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"bashls",
				"clangd",
				"biome",
				"ts_ls",
				"jsonls",
				"omnisharp",
			},
			automatic_installation = true,
		})
	end,
}
