vim.pack.add ({
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/ibhagwan/fzf-lua' }
})

local fzf = require("fzf-lua")

vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader>fg', fzf.live_grep)
vim.keymap.set('n', '<leader>fb', fzf.buffers)

vim.keymap.set('n', '<leader>fzf', fzf.builtin)

vim.keymap.set('n', 'gd', fzf.lsp_definitions)
vim.keymap.set('n', 'gr', fzf.lsp_references)
vim.keymap.set('n', 'gi', fzf.lsp_implementations)
vim.keymap.set('n', 'sy', fzf.lsp_document_symbols)
vim.keymap.set('n', 'tsy', fzf.treesitter)
