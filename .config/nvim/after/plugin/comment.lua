local status_ok, comment = pcall(require, 'Comment')
if not status_ok then return end

local status_ok_1, _ = pcall(require, 'lsp-inlayhints')
if not status_ok_1 then return end

comment.setup {
    ---Add a space b/w comment and the line
    padding = true,

    ---Whether the cursor should stay at its position
    ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
    sticky = true,

    ---Lines to be ignored while comment/uncomment.
    ---Could be a regex string or a function that returns a regex string.
    ---Example: Use '^$' to ignore empty lines
    ignore = nil,

    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc'
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb'
    },

    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA'
    },

    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---NOTE: If `mappings = false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,
        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = true
    },
    ---Pre-hook, called before commenting the line
    pre_hook = function(ctx)
        -- For inlay hints
        local line_start = (ctx.srow or ctx.range.srow) - 1
        local line_end = ctx.erow or ctx.range.erow
        require('lsp-inlayhints.core').clear(0, line_start, line_end)

        require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()

        if vim.bo.filetype == 'javascript' or vim.bo.filetype == 'typescript' then
            local U = require 'Comment.utils'

            -- Determine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.linewise and '__default' or
                             '__multiline'

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.blockwise then
                location =
                    require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location =
                    require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return
                require('ts_context_commentstring.internal').calculate_commentstring {
                    key = type,
                    location = location
                }
        end
    end,
    ---Post-hook, called after commenting is done
    post_hook = nil
}
