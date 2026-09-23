local modes = {
    ['n']   = 'NORMAL',
    ['v']   = 'VISUAL',
    ['V']   = 'V-LINE',
    ['\22'] = 'V-BLOCK',
    ['i']   = 'INSERT',
    ['ic']  = 'INSERT',
    ['R']   = 'REPLACE',
    ['c']   = 'COMMAND',
    ['t']   = ' ',
    ['nt']  = ' ',
}

-- 1. Get current mode
local function get_mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[current_mode] or current_mode)
end

function MyStatusLine()
    return table.concat({
        get_mode(), -- Left: Mode
        -- get_file_info(),     -- Left: File info
        -- get_lsp_status(),    -- Left: LSP Status
        "%=", -- Alignment Separator (splits left and right sides)
        -- get_ruler(),         -- Right: Line/Col info
    })
end

vim.opt.showmode = false
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.statusline = "%!v:lua.MyStatusLine()"
