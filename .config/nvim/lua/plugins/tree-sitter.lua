vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter',            version = 'main' },
    -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
    -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' }
})

-- require 'nvim-treesitter.configs'.setup {
--     ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
--     ignore_install = {},
--
--     sync_install = false,
--     auto_install = true,
--     highlight = {
--         enable = true,
--
--         disable = function(_, buf)
--             local max_filesize = 100 * 1024
--             local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--             if ok and stats and stats.size > max_filesize then
--                 return true
--             end
--         end,
--
--         additional_vim_regex_highlighting = false,
--     },
--
--     fold = { enable = true, auto_open = false, auto_close = false },
--     incremental_selection = {
--         enable = true,
--         keymaps = {
--             init_selection = "gnn",
--             node_incremental = "grn",
--             scope_incremental = "grc",
--             node_decremental = "grm",
--         },
--     },
-- }
