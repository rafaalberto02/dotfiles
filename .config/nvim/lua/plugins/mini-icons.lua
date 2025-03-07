return {{
    "echasnovski/mini.nvim",
    version = '*',
    config = function () 
        local configs = require('mini.icons')

        configs.setup({
            style = 'glyph',

            default   = {},
            directory = {},
            extension = {},
            file      = {},
            filetype  = {},
            lsp       = {},
            os        = {},

            use_file_extension = function(ext, file) 
                return true 
            end,
        })
    end
}}
