-- For use with VSCode Neovim extension
-- Maps Neovim keybindings to VSCode commands using vscode.action()
local opts = { noremap = true, silent = true }

local vscode = require("vscode")

vim.keymap.set("n", "K", function() vscode.action("editor.action.showHover") end, opts)
vim.keymap.set("n", "gd", function() vscode.action("editor.action.revealDefinition") end, opts)
vim.keymap.set("n", "gD", function() vscode.action("editor.action.revealDeclaration") end, opts)
vim.keymap.set("n", "gi", function() vscode.action("editor.action.goToImplementation") end, opts)
vim.keymap.set("n", "go", function() vscode.action("editor.action.goToTypeDefinition") end, opts)
vim.keymap.set("n", "gr", function() vscode.action("references-view.findReferences") end, opts)
vim.keymap.set("n", "gs", function() vscode.action("editor.action.triggerParameterHints") end, opts)
vim.keymap.set("n", "<leader>rn", function() vscode.action("editor.action.rename") end, opts)
vim.keymap.set("n", "<leader>ca", function() vscode.action("editor.action.codeAction") end, opts)
