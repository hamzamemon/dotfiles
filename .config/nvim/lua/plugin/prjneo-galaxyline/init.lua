local gl = require('galaxyline')
-- local colors = require('galaxyline.theme').default
local colors = {
    bg = '#282a36',
    yellow = '#f1fa8c',
    dark_yellow = '#d7ba7d',
    cyan = '#8be9fd',
    green = '#50fa7b',
    light_green = '#b5cea8',
    string_orange = '#ce9178',
    orange = '#ffb86c',
    purple = '#bd93f9',
    magenta = '#d16d9e',
    gray = '#858585',
    blue = '#569cd6',
    vivid_blue = '#4fc1ff',
    light_blue = '#9cdcfe',
    red = '#ff5555',
    info_yellow = '#ffcc66'
}
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.blue,
                i = colors.green,
                v = colors.purple,
                [''] = colors.purple,
                V = colors.purple,
                c = colors.magenta,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.blue,
                t = colors.blue
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '▊ '
        end,
        highlight = {colors.red, colors.bg},
	separator = ' ',
        separator_highlight = {'NONE',colors.bg},
    }
}
print(vim.fn.getbufvar(0, 'ts'))
vim.fn.getbufvar(0, 'ts')

gls.left[2] = {
    GitIcon = {
        provider = function()
            return ' '
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[3] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[4] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green, colors.bg}
    }
}

gls.left[5] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.yellow, colors.bg}
    }
}

gls.left[6] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}

gls.left[7] = {
  FileName = {
    provider = {'FileName'},
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta, colors.bg, 'bold'}
  }
}

gls.right[1] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.darkblue},
  },
}

gls.right[2] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[3] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow, colors.bg}
    }
}

gls.right[4] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.gray, colors.bg}
    }
}

gls.right[5] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.gray, colors.bg}
    }
}

gls.right[6] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = ' ',
        highlight = {colors.gray, colors.bg}
    }
}

gls.right[7] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.gray, colors.bg}
    }
}

gls.right[8] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.gray, colors.bg}
    }
}

gls.right[9] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.gray, colors.bg}
    }
}

gls.right[10] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.gray, colors.bg}
    }
}

gls.right[11] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.gray, colors.bg}
    }
}

gls.right[12] = {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.gray, colors.bg}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.gray, colors.bg}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = {colors.gray, colors.bg}
    }
}
