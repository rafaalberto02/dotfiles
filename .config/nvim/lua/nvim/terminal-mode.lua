vim.api.nvim_create_autocmd("TermClose", {
    desc = "Automatically close terminal buffers when the process exits successfully",
    callback = function(ev)
        if vim.v.event.status == 0 then
            vim.api.nvim_buf_delete(ev.buf, { force = true })
        end
    end,
})

vim.keymap.set("n", "<space>st", function()
    local dir = require("oil").get_current_dir() or vim.b.netrw_curdir or vim.fn.expand("%:p:h")

    vim.cmd("botright new")

    vim.fn.jobstart(vim.o.shell, {
        term = true,
        cwd = dir,
    })

    vim.api.nvim_win_set_height(0, 15)
end, { silent = true })


vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
        vim.wo.signcolumn = 'yes'
        vim.wo.scrolloff = 10
    end,
})

if vim.fn.has("win32") then
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag = "-c"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

vim.keymap.set("t", "<C-c><C-c>", [[<C-\><C-N>]], { silent = true })

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { silent = true })
