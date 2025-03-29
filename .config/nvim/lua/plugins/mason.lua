return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("mason").setup()
	end,
}
