return {
	"Hoffs/omnisharp-extended-lsp.nvim",
	dependecies = { "neovim/nvim-lspconfig" },
	ft = { "cs" },
	config = function()
		require("lspconfig").omnisharp.setup({
			settings = {
				FormattingOptions = {
					EnableEditorConfigSupport = true,
					OrganizeImports = true,
				},
				MsBuild = {
					LoadProjectsOnDemand = nil,
				},
				RoslynExtensionsOptions = {
					EnableAnalyzersSupport = true,
					EnableImportCompletion = true,
					AnalyzeOpenDocumentsOnly = nil,
				},
				Sdk = {
					IncludePrereleases = true,
				},
			},

			handlers = {
				["textDocument/definition"] = require("omnisharp_extended").definition_handler,
				["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
				["textDocument/references"] = require("omnisharp_extended").references_handler,
				["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
			},
		})
	end,
}
