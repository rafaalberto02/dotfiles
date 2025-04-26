return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "nvim-treesitter/nvim-treesitter-refactor" },
		},
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treesitter** module to be loaded in time.
			-- Luckily, the only things that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				modules = {},
				ignore_install = {},
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"html",
					"markdown",
					"markdown_inline",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				fold = { enable = true, auto_open = false, auto_close = false },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				refactor = {
					highlight_definitions = {
						enable = true,
						clear_on_cursor_move = true,
						highlight_current_scope = { enable = true },
					},
					smart_rename = {
						enable = true,
						keymaps = {
							smart_rename = "grr",
						},
					},
					navigation = {
						enable = true,
						keymaps = {
							goto_definition = false,
							list_definitions = false,
							list_definitions_toc = false,
							goto_next_usage = "gnu",
							goto_previous_usage = "gpu",
						},
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						include_surrounding_whitespace = false,
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]o"] = "@loop.*",
							["]]"] = { query = "@class.outer", desc = "Next class start" },
							["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
						goto_next = {
							["]d"] = "@conditional.outer",
						},
						goto_previous = {
							["[d"] = "@conditional.outer",
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function()
					vim.opt_local.foldmethod = "expr"
					vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
					vim.opt_local.foldlevel = 99
				end,
			})
		end,
	},
}
