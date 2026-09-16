vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
})

require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'c', 'javascript', 'go' }

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
        -- Check if the parser is installed and readable
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start() -- Start highlighting
        end
    end,
})
