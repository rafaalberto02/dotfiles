return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
	opts = {},
	config = function()
		require("mason").setup()
	end,
}
