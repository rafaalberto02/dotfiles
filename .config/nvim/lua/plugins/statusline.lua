vim.pack.add({
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' }
})

require('nvim-web-devicons').setup({
    variant = "dark",
})

local icons = require('nvim-web-devicons')


-- Get a DevIcon glyph by its name.
local function get_icon(name)
    for _, icon in pairs(icons.get_icons()) do
        if icon.name == name then
            return icon.icon
        end
    end

    return '?'
end


-- Icons that represent each kind of mode.
local mode_icons = {
    normal   = get_icon('Vim'),
    operator = get_icon('GitCommit'),
    visual   = get_icon('Diff'),
    select   = get_icon('Markdown'),
    insert   = get_icon('EditorConfig'),
    replace  = get_icon('GitCommit'),
    command  = get_icon('Terminal'),
    prompt   = get_icon('Info'),
    terminal = get_icon('Terminal'),
}


-- Every mode from nvim_get_mode().
local modes = {
    -- Normal
    ['n']       = mode_icons.normal,
    ['niI']     = mode_icons.normal,
    ['niR']     = mode_icons.normal,
    ['niV']     = mode_icons.normal,
    ['nt']      = mode_icons.normal,
    ['ntT']     = mode_icons.normal,

    -- Operator-pending
    ['no']      = mode_icons.operator,
    ['nov']     = mode_icons.operator,
    ['noV']     = mode_icons.operator,
    ['noCTRL-V'] = mode_icons.operator,

    -- Visual
    ['v']       = mode_icons.visual,
    ['vs']      = mode_icons.visual,
    ['V']       = mode_icons.visual,
    ['Vs']      = mode_icons.visual,
    ['\22']     = mode_icons.visual,
    ['\22s']    = mode_icons.visual,

    -- Select
    ['s']       = mode_icons.select,
    ['S']       = mode_icons.select,
    ['\19']     = mode_icons.select,

    -- Insert
    ['i']       = mode_icons.insert,
    ['ic']      = mode_icons.insert,
    ['ix']      = mode_icons.insert,

    -- Replace
    ['R']       = mode_icons.replace,
    ['Rc']      = mode_icons.replace,
    ['Rx']      = mode_icons.replace,
    ['Rv']      = mode_icons.replace,
    ['Rvc']     = mode_icons.replace,
    ['Rvx']     = mode_icons.replace,

    -- Virtual Replace
    ['gR']      = mode_icons.replace,

    -- Command-line
    ['c']       = mode_icons.command,
    ['cr']      = mode_icons.command,
    ['cv']      = mode_icons.command,

    -- Hit-enter / confirmation prompts
    ['r']       = mode_icons.prompt,
    ['rm']      = mode_icons.prompt,
    ['r?']      = mode_icons.prompt,

    -- Shell command
    ['!']       = mode_icons.terminal,

    -- Terminal
    ['t']       = mode_icons.terminal,
}


-- Get current mode.
local function get_mode()
    local current_mode = vim.api.nvim_get_mode().mode

    return string.format(
        "%s",
        modes[current_mode] or current_mode
    )
end


function MyStatusLine()
    return table.concat({
        get_mode(),

        "%=",

        -- get_file_info(),
        -- get_lsp_status(),
        -- get_ruler(),
    })
end


vim.opt.showmode = false
vim.opt.laststatus = 2
-- vim.opt.statusline = "%!v:lua.MyStatusLine()"
