return {
    name = "make_ls",
    cmd = { "make-ls" },
    root_dir = vim.fs.root(0, { "Makefile", "makefile", "GNUmakefile" }),
    filetypes = { "make" },
    handlers = {
        ["textDocument/completion"] = function(err, result, ctx, config)
            if result == vim.NIL or result == nil then
                result = { isIncomplete = false, items = {} }
            elseif result.items == vim.NIL or result.items == nil then
                result.items = {}
            end

            vim.lsp.handlers["textDocument/completion"](err, result, ctx, config)
        end,
    },
}
