vim.api.nvim_create_autocmd("TermClose", {
    desc = "Automatically close terminal buffers when the process exits successfully",
    callback = function(ev)
        if vim.v.event.status == 0 then
            vim.api.nvim_buf_delete(ev.buf, { force = true })
        end
    end,
})

vim.keymap.set("n", "<space>st", function()
    local dir = vim.b.netrw_curdir or vim.fn.expand("%:p:h")

    vim.cmd("botright new")

    vim.fn.jobstart(vim.o.shell, {
        term = true,
        cwd = dir,
    })

    vim.api.nvim_win_set_height(0, 15)
end, { silent = true })

vim.keymap.set("t", "<esc><esc>", [[<C-\><C-N>]], { silent = true })
