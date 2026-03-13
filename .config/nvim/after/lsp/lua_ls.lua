vim.pack.add({ { src = 'https://github.com/folke/lazydev.nvim' } })

require("lazydev").setup()

return {
    Lua = {
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
        },
        diagnostics = {
            globals = { 'vim' },
        },
        runtime = {
            version = 'LuaJIT',
        },
    },
}
