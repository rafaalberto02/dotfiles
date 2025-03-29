return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "saghen/blink.cmp" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		vim.opt.signcolumn = "yes"
	end,
	config = function()
		local lsp = require("lspconfig")
		local blink = require("blink.cmp")

		local lsp_defaults = lsp.util.default_config
		local vim_capabilities = vim.lsp.protocol.make_client_capabilities()

		local capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, vim_capabilities)

		capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities({}, false))

		require("mason-lspconfig").setup({
			ensure_installed = {},
			handlers = {
				function(server_name)
					lsp[server_name].setup({})
				end,
				["lua_ls"] = function()
					lsp.lua_ls.setup({
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
									path = vim.split(package.path, ";"),
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = { vim.env.VIMRUNTIME },
									checkThirdParty = false,
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
				["jsonls"] = function()
					lsp.jsonls.setup({
						settings = {
							json = {
								schemas = {
									{
										fileMatch = { "package.json" },
										url = "https://json.schemastore.org/package.json",
									},
								},
							},
						},
					})
				end,
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})
	end,
}
