vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'pt_br' }
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})

require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
})

require('nvim-treesitter').install { 'markdown', 'markdown_inline', 'html', 'latex', 'yaml' }
