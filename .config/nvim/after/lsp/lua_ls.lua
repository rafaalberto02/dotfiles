return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
