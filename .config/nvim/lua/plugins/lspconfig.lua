vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' }
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls" }
})


local opts = { noremap = true, silent = true }

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

vim.keymap.set("n", "<leader>cl", function()
    vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
end)

vim.keymap.set("n", "<leader>dh", function()
    vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
end)

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set('i', '<c-space>', vim.lsp.completion.get)


vim.lsp.codelens.enable(false)
vim.lsp.document_color.enable()

vim.diagnostic.config({ virtual_text = true })

vim.cmd [[set completeopt=menu,menuone,noselect,noinsert]]

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        if client:supports_method('textDocument/linkedEditingRange') then
            vim.lsp.linked_editing_range.enable(true, { client_id = client.id });
        end

        if client:supports_method('textDocument/documentHighlight') then
            local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", {})

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = ev.buf,
                group = group,
                callback = function()
                    vim.lsp.buf.document_highlight()
                end,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved" }, {
                buffer = ev.buf,
                group = group,
                callback = function()
                    vim.lsp.buf.clear_references()
                end,
            })
        end
    end,
})
