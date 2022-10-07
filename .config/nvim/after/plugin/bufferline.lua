local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then return end

bufferline.setup {
    options = {
        mode = 'buffers', -- set to 'tabs' to only show tabpages instead
        numbers = 'none', -- | 'ordinal' | 'buffer_id' | 'both' | function({ ordinal, id, lower, raise }): string,
        close_command = 'Bdelete! %d', -- can be a string | function, see 'Mouse actions'
        right_mouse_command = 'Bdelete! %d', -- can be a string | function, see 'Mouse actions'
        left_mouse_command = 'buffer %d', -- can be a string | function, see 'Mouse actions'
        middle_mouse_command = nil, -- can be a string | function, see 'Mouse actions'
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon' --  | 'underline' | 'none'
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf) -- buf contains a 'name', 'path' and 'bufnr'
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
                return vim.fn.fnamemodify(buf.name, ':t:r')
            end
        end,
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = false, -- | 'nvim_lsp' | 'coc',
        diagnostics_update_in_insert = true,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return '(' .. count .. ')'
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        -- custom_filter = function(buf_number)
        --   -- filter out filetypes you don't want to see
        --   if vim.bo[buf_number].filetype ~= '<i-dont-want-to-see-this>' then
        --     return true
        --   end
        --   -- filter out by buffer name
        --   if vim.fn.bufname(buf_number) ~= '<buffer-name-I-dont-want>' then
        --     return true
        --   end
        --   -- filter out based on arbitrary rules
        --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --   if vim.fn.getcwd() == '<work-repo>' and vim.bo[buf_number].filetype ~= 'wiki' then
        --     return true
        --   end
        -- end,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer', -- | function
                text_align = 'left', -- | 'center' | 'right'
                separator = true
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = 'thin', -- | 'thick' | 'thin' | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true
        -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --   -- add custom logic
        --   return buffer_a.modified > buffer_b.modified
        -- end
    },
    highlights = {
        fill = {fg = '#ff0000', bg = 'TabLine'},
        background = {fg = 'TabLine', bg = 'TabLine'},
        tab = {fg = 'TabLine', bg = 'TabLine'},
        tab_selected = {fg = 'Normal', bg = 'Normal'},
        tab_close = {fg = 'LspDiagnosticsDefaultError', bg = 'Normal'},
        close_button = {fg = 'TabLine', bg = 'TabLine'},
        close_button_visible = {fg = 'TabLine', bg = 'TabLine'},
        close_button_selected = {fg = 'TabLineSel', bg = 'TabLineSel'},
        buffer_visible = {fg = 'TabLine', bg = 'TabLine'},
        buffer_selected = {
            fg = 'Normal',
            bg = 'Normal',
            bold = true,
            italic = true
        },
        numbers = {fg = 'TabLineSel', bg = 'TabLineSel'},
        numbers_visible = {fg = 'TabLineSel', bg = 'TabLineSel'},
        numbers_selected = {
            fg = 'TabLineSel',
            bg = 'TabLineSel',
            bold = true,
            italic = true
        },
        diagnostic = {fg = '#00ff00', bg = 'Normal'},
        diagnostic_visible = {fg = '#00ff00', bg = 'Normal'},
        diagnostic_selected = {
            fg = '#00ff00',
            bg = 'Normal',
            bold = true,
            italic = true
        },
        modified = {fg = 'TabLine', bg = 'TabLine'},
        modified_visible = {fg = 'TabLine', bg = 'TabLine'},
        modified_selected = {fg = 'Normal', bg = 'Normal'},
        duplicate_selected = {
            fg = 'TabLineSel',
            bg = 'TabLineSel',
            italic = true
        },
        duplicate_visible = {fg = 'TabLine', bg = 'TabLine', italic = true},
        duplicate = {fg = 'TabLine', bg = 'TabLine', italic = true},
        separator_selected = {fg = 'Normal', bg = 'Normal'},
        separator_visible = {fg = 'TabLine', bg = 'TabLine'},
        separator = {fg = 'TabLine', bg = 'TabLine'},
        indicator_selected = {fg = 'LspDiagnosticsDefaultHint', bg = 'Normal'},
        pick_selected = {
            fg = 'TabLineSel',
            bg = 'TabLineSel',
            bold = true,
            italic = true
        },
        pick_visible = {
            fg = 'TabLine',
            bg = 'TabLine',
            bold = true,
            italic = true
        },
        pick = {fg = 'TabLine', bg = 'TabLine', bold = true, italic = true},
        offset_separator = {
            fg = win_separator_fg,
            bg = separator_background_color
        }
    }
}
