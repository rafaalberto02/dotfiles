return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = { "InsertEnter" },
    version = "1.*",
    opts = {
        signature = { enabled = true },
        keymap = { preset = "default" },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = { documentation = { auto_show = true } },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
