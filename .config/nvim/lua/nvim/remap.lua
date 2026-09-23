vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.config/commonrc/scripts/tmux-auto-session.bash<CR>")

vim.keymap.set("n", "<Leader>pv", ":Ex<CR>")

vim.keymap.set("n", "<space>st", function()
    local dir = require("oil").get_current_dir() or vim.fn.expand("%:p:h")

    vim.cmd("botright new")

    vim.fn.jobstart(vim.o.shell, {
        term = true,
        cwd = dir,
    })

    vim.api.nvim_win_set_height(0, 15)
end)

vim.keymap.set("t", "<C-w>", [[<C-\><C-N>]])

