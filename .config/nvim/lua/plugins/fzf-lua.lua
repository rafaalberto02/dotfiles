return {{
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function () 
        local configs = require("fzf-lua")

        configs.setup({
            fzf_colors = true 
        })
    end
}}
