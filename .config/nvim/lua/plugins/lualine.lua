return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/tokyonight.nvim" },
    enabled = false,
	config = function()
		require("lualine").setup({
			options = { theme = "tokyonight" },
		})
	end,
}
