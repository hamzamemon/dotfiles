local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

local icons = require 'hamzamemon.icons'

local colors = {
    bg = '#282a36',
    blue = '#569cd6',
    orange = '#ffb86c',
    dark_orange = '#c18a56',
    purple = '#bd93f9',
    cyan = '#8be9fd',
    magenta = '#d16d9e',
    green = '#50fa7b',
    red = '#ff757f',
    pink = '#d16d9e',
    yellow = '#f1fa8c'
}

local mode_color = {
    n = colors['blue'],
    i = colors['orange'],
    v = colors['yellow'],
    [""] = colors['yellow'],
    V = colors['yellow'],
    c = colors['purple'],
    no = colors['magenta'],
    s = colors['green'],
    S = colors['dark_orange'],
    [""] = colors['dark_orange'],
    ic = colors['red'],
    R = colors['pink'],
    Rv = colors['red'],
    cv = colors['blue'],
    ce = colors['blue'],
    r = colors['red'],
    rm = colors['cyan'],
    ["r?"] = colors['cyan'],
    ["!"] = colors['cyan'],
    t = colors['red']
}

local mode = {
    -- mode component
    function(str) return "▊" end,
    color = function()
        -- auto change color according to neovims mode
        return {fg = mode_color[vim.fn.mode()], bg = colors['bg']}
    end,
    padding = 0
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = {icons.git.Branch, align = 'left', color = {fg = colors['orange']}},
    color = {fg = colors['orange'], gui = 'bold'},
    colored = true,
    padding = 1,
    -- cond = hide_in_width_100,
    fmt = function(str)
        if str == "" or str == nil then return "!=vcs" end

        return str
    end
}

local diff = {
    "diff",
    colored = true,
    symbols = {
        added = icons.git.Add .. " ",
        modified = icons.git.Mod .. " ",
        removed = icons.git.Remove .. " "
    }, -- changes diff symbols
    cond = hide_in_width_60,
    separator = "%#SLSeparator#" .. "│ " .. "%*"
}

local diagnostics = {
    "diagnostics",
    sources = {"nvim_lsp"},
    sections = {"error", "warn", 'info', 'hint'},
    diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn = 'DiagnosticWarn', -- Changes diagnostics' warn color.
        info = 'DiagnosticInfo', -- Changes diagnostics' info color.
        hint = 'DiagnosticHint' -- Changes diagnostics' hint color.
    },
    symbols = {
        error = "%#SLError#" .. icons.diagnostics.Error .. "%*" .. " ",
        warn = "%#SLWarning#" .. icons.diagnostics.Warning .. "%*" .. " ",
        info = "%#SLWarning#" .. icons.diagnostics.Warning .. "%*" .. " ",
        hint = "%#SLWarning#" .. icons.diagnostics.Warning .. "%*" .. " "
    },
    colored = true,
    update_in_insert = true,
    always_visible = false,
    padding = 0
}

local filename = {
    'filename',
    file_status = true, -- Displays file status (readonly status, modified status)
    path = 0, -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path
    -- 3: Absolute path, with tilde as the home directory
    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    -- for other components. (terrible name, any suggestions?)
    symbols = {
        modified = icons.documents.Modified, -- Text to show when the file is modified.
        readonly = icons.documents.ReadOnly, -- Text to show when the file is non-modifiable or readonly.
        unnamed = icons.documents.Unnamed -- Text to show for unnamed buffers.
    },
    color = {fg = colors['green'], gui = 'bold'},
    colored = true
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {
            left = icons.ui.SeparatorLeft,
            right = icons.ui.SeparatorRight
        },
        section_separators = {
            left = icons.ui.SeparatorSectionLeft,
            right = icons.ui.SeparatorSectionRight
        },
        disabled_filetypes = {statusline = {}, winbar = {}},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {statusline = 1000, tabline = 1000, winbar = 1000}
    },
    sections = {
        lualine_a = {mode},
        lualine_b = {branch, diff, diagnostics},
        lualine_c = {filename},
        lualine_x = {"require'lsp-status'.status()"},
        lualine_y = {},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
