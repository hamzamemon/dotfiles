local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then return end

M = {}

-- check if value in table
local function contains(t, value)
    for _, v in pairs(t) do if v == value then return true end end
    return false
end

local colors = {
    dark_gray = '#282a36',
    gray = '#32363e',
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
    [''] = colors['yellow'],
    V = colors['yellow'],
    c = colors['purple'],
    no = colors['magenta'],
    s = colors['green'],
    S = colors['dark_orange'],
    [''] = colors['dark_orange'],
    ic = colors['red'],
    R = colors['pink'],
    Rv = colors['red'],
    cv = colors['blue'],
    ce = colors['blue'],
    r = colors['red'],
    rm = colors['cyan'],
    ['r?'] = colors['cyan'],
    ['!'] = colors['cyan'],
    t = colors['red']
}

vim.api.nvim_set_hl(0, 'SLSep', {fg = colors['gray'], bg = 'NONE'})
vim.api.nvim_set_hl(0, 'SLSeparator',
                    {fg = '#6b727f', bg = 'NONE', italic = true})
vim.api.nvim_set_hl(0, 'SLError', {fg = colors['red'], bg = 'NONE'})
vim.api.nvim_set_hl(0, 'SLWarning', {fg = colors['yellow'], bg = 'NONE'})
vim.api.nvim_set_hl(0, 'SLHint', {fg = colors['blue'], bg = 'NONE'})
vim.api.nvim_set_hl(0, 'SLInformation', {fg = colors['green'], bg = 'NONE'})
vim.api.nvim_set_hl(0, 'SLLocation', {fg = colors['blue'], bg = colors['gray']})
vim.api.nvim_set_hl(0, 'SLProgress',
                    {fg = colors['purple'], bg = colors['gray']})

local hl_str = function(str, hl) return '%#' .. hl .. '#' .. str .. '%*' end

local hide_in_width_60 = function() return vim.o.columns > 60 end
local hide_in_width = function() return vim.o.columns > 80 end
local hide_in_width_100 = function() return vim.o.columns > 100 end

local icons = require 'hamzamemon.icons'

local mode = {
    -- mode component
    function() return '▊' end,
    color = function()
        -- auto change color according to neovims mode
        return {fg = mode_color[vim.fn.mode()], bg = colors['gray']}
    end,
    padding = 0
}

local diff = {
    'diff',
    colored = true,
    symbols = {
        added = icons.git.Add .. ' ',
        modified = icons.git.Mod .. ' ',
        removed = icons.git.Remove .. ' '
    }, -- changes diff symbols
    cond = hide_in_width_60,
    separator = '%#SLSeparator#' .. '│ ' .. '%*'
}

local diagnostics = {
    'diagnostics',
    sources = {'nvim_lsp'},
    sections = {'error', 'warn', 'info', 'hint'},
    diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn = 'DiagnosticWarn', -- Changes diagnostics' warn color.
        info = 'DiagnosticInfo', -- Changes diagnostics' info color.
        hint = 'DiagnosticHint' -- Changes diagnostics' hint color.
    },
    symbols = {
        error = '%#SLError#' .. icons.diagnostics.Error .. '%*' .. ' ',
        warn = '%#SLWarning#' .. icons.diagnostics.Warning .. '%*' .. ' ',
        info = '%#SLInformation#' .. icons.diagnostics.Information .. '%*' ..
            ' ',
        hint = '%#SLHint#' .. icons.diagnostics.Hint .. '%*' .. ' '
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

local branch = {
    'branch',
    icons_enabled = true,
    icon = {icons.git.Branch, align = 'left', color = {fg = colors['orange']}},
    color = {fg = colors['orange'], gui = 'bold'},
    colored = true,
    padding = 1,
    -- cond = hide_in_width_100,
    fmt = function(str)
        if str == '' or str == nil then return '!=vcs' end

        return str
    end
}

local language_server = {
    function()
        local buf_ft = vim.bo.filetype
        local ui_filetypes = {
            'help', 'packer', 'neogitstatus', 'NvimTree', 'Trouble', 'Outline',
            'spectre_panel', 'TelescopePrompt', 'lspinfo', 'lsp-installer', ''
        }

        if contains(ui_filetypes, buf_ft) then
            if M.language_servers == nil then
                return ''
            else
                return M.language_servers
            end
        end

        local client_names = {}

        -- add formatter
        local s = require 'null-ls.sources'
        local available_sources = s.get_available(buf_ft)
        local registered = {}
        for _, source in ipairs(available_sources) do
            for method in pairs(source.methods) do
                registered[method] = registered[method] or {}
                table.insert(registered[method], source.name)
            end
        end

        local formatter = registered['NULL_LS_FORMATTING']
        local linter = registered['NULL_LS_DIAGNOSTICS']
        if formatter ~= nil then vim.list_extend(client_names, formatter) end
        if linter ~= nil then vim.list_extend(client_names, linter) end

        -- join client names with commas
        local client_names_str = table.concat(client_names, ', ')

        -- check client_names_str if empty
        local language_servers = ''
        local client_names_str_len = #client_names_str
        if client_names_str_len ~= 0 then
            language_servers = hl_str('', 'SLSep') ..
                                   hl_str(client_names_str, 'SLSeparator') ..
                                   hl_str('', 'SLSep')
        end

        M.language_servers = language_servers
        return language_servers:gsub(', anonymous source', '')
    end,
    padding = 0,
    cond = hide_in_width
    -- separator = '%#SLSeparator#' .. ' │' .. '%*',
}

local location = {
    'location',
    fmt = function(str)
        -- return '▊'
        return hl_str(' ', 'SLSep') .. hl_str(str, 'SLLocation') ..
                   hl_str(' ', 'SLSep')
        -- return '  '
    end,
    padding = 0
}

local progress = {
    'progress',
    fmt = function(str)
        -- return '▊'
        return hl_str('', 'SLSep') .. hl_str('%P/%L', 'SLProgress') ..
                   hl_str(' ', 'SLSep')
        -- return '  '
    end,
    -- color = 'SLProgress',
    padding = 0
}

lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = 'auto',
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = {mode},
        lualine_b = {branch, diff, diagnostics},
        lualine_c = {filename},
        lualine_x = {"require'lsp-status'.status()"},
        lualine_y = {language_server},
        lualine_z = {location, progress}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
