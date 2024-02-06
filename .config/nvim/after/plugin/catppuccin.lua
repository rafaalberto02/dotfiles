require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		telescope = { enabled = true },
		mason = true,
		navic = {
			enabled = true,
			custom_bg = "NONE", -- "lualine" will set background to mantle
		},
	},
	custom_highlights = function(colors)
		return {
			--LineNrAbove = { fg = colors.flamingo },
			LineNr = { fg = colors.sky },
			--LineNrBelow = { fg = colors.red },
		}
	end
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
