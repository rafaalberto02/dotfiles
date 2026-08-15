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
-- moved to conform
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

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

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = false,
})

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

vim.filetype.add({
    extension = {
        gotmpl = "gotmpl",
    },
    pattern = {
        -- Docker & Docker Compose
        ["[Cc]ompose.*%.ya?ml"] = "yaml.docker-compose",
        ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
        ["Dockerfile.*"] = "dockerfile",
        ["dockerfile.*"] = "dockerfile",

        -- Ansible
        [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
        [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*%.ya?ml"] = "yaml.ansible",
        [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
        [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
        ["site%.ya?ml"] = "yaml.ansible",
        ["main%.ya?ml"] = "yaml.ansible",

        -- Go Template
        [".*%.tmpl%.ya?ml"] = "gotmpl",
        [".*%.tpl"] = "gotmpl",
    },
})
