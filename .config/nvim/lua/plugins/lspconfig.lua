vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' }
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls" }
})


vim.lsp.codelens.enable(false)
vim.lsp.document_color.enable()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
})

vim.o.complete = '.,w,b,o'
vim.o.completeopt = 'menuone,noselect,fuzzy'

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf, noremap = true, silent = true }

        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        if client:supports_method('textDocument/linkedEditingRange') then
            vim.lsp.linked_editing_range.enable(true, { client_id = client.id });
        end

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        vim.keymap.set("n", "<leader>cl", function()
            vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
        end)

        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
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
