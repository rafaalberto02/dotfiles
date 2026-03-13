vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' }
})

local treesitter = require('nvim-treesitter')

treesitter.setup()

treesitter.install({ 'lua', 'javascript' })
