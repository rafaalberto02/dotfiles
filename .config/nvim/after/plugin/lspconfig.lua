require("mason").setup()
require("mason-lspconfig").setup()

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
    end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT', },
                diagnostics = { globals = { 'vim', 'require', 'on_attach' }, },
                workspace = { library = vim.api.nvim_get_runtime_file("", true), },
                telemetry = { enable = false, },
            },
        },
    },
    bashls = {},
    jsonls = {},
}

local lsp_config = require("lspconfig")

for name, user_opts in pairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  opts = vim.tbl_deep_extend('force', opts, user_opts)
  lsp_config[name].setup(opts)
end
