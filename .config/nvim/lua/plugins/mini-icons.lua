return {
	{
		"echasnovski/mini.icons",
		version = "*",
		config = function()
			local configs = require("mini.icons")

			configs.setup({
				style = "glyph",

				default = {},
				directory = {},
				extension = {},
				file = {},
				filetype = {},
				lsp = {},
				os = {},

				use_file_extension = function(_, __)
					return true
				end,
			})
		end,
	},
}
