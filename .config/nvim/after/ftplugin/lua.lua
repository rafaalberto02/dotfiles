local current_file = vim.fn.expand("%:p:h")
local config_dir = vim.fn.stdpath("config")

if vim.startswith(current_file, config_dir) then
    require("lazydev").setup({
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    })
end
