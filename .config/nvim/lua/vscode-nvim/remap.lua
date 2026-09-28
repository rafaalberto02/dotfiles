local opts = { silent = true }

local vscode = require("vscode")

vim.keymap.set("v", "J", function() vscode.action("editor.action.moveLinesDownAction") end, { silent = true })
vim.keymap.set("v", "K", function() vscode.action("editor.action.moveLinesUpAction") end, { silent = true })

vim.keymap.set("n", "K", function() vscode.action("editor.action.showHover") end, opts)
vim.keymap.set("n", "gd", function() vscode.action("editor.action.revealDefinition") end, opts)
vim.keymap.set("n", "gD", function() vscode.action("editor.action.revealDeclaration") end, opts)
vim.keymap.set("n", "gi", function() vscode.action("editor.action.goToImplementation") end, opts)
vim.keymap.set("n", "go", function() vscode.action("editor.action.goToTypeDefinition") end, opts)
vim.keymap.set("n", "gr", function() vscode.action("references-view.findReferences") end, opts)
vim.keymap.set("n", "gs", function() vscode.action("editor.action.triggerParameterHints") end, opts)
vim.keymap.set("n", "gcc", function() vscode.action("editor.action.commentLine") end, opts)
vim.keymap.set("v", "gc", function() vscode.action("editor.action.commentLine") end, opts)
vim.keymap.set("n", "<leader>rn", function() vscode.action("editor.action.rename") end, opts)
vim.keymap.set("n", "<leader>ca", function() vscode.action("editor.action.codeAction") end, opts)

vim.keymap.set("n", "<leader>f", function() vscode.action("editor.action.formatDocument") end, opts)

vim.keymap.set("n", "<leader>ff", function() vscode.action("workbench.action.quickOpen") end, opts)
vim.keymap.set("n", "<leader>fg", function() vscode.action("workbench.action.findInFiles") end, opts)

vim.keymap.set("n", "<leader>xx", function() vscode.action("workbench.actions.view.problems") end, opts)
vim.keymap.set("n", "<leader>st", function() vscode.action("workbench.action.terminal.toggleTerminal") end, opts)

vim.keymap.set("n", "<leader>pv", function() vscode.action("workbench.view.explorer") end, opts)

vim.keymap.set("n", "<C-o>", function() vscode.action("workbench.action.navigateBack") end, opts)
vim.keymap.set("n", "<C-i>", function() vscode.action("workbench.action.navigateForward") end, opts)

vim.keymap.set("i", "<C-Space>", function() vscode.action("editor.action.triggerSuggest") end, opts)
