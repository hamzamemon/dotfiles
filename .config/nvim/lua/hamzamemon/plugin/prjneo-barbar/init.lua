local status_ok, barbar = pcall(require, "barbar")
if not status_ok then return end

-- Set barbar's options
barbar.setup {
    -- Enable/disable animations
    animation = true,

    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = true,

    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = true,

    -- Enable/disable close button
    closable = true,

    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,

    -- Excludes buffers from the tabline
    -- exclude_ft = {'javascript'},
    exclude_name = {},

    -- Enable/disable icons
    -- if set to 'numbers', will show buffer index in the tabline
    -- if set to 'both', will show buffer index and icons in the tabline
    icons = true,

    -- If set, the icon color will follow its corresponding buffer
    -- highlight group. By default, the Buffer*Icon group is linked to the
    -- Buffer* group (see Highlighting below). Otherwise, it will take its
    -- default value as defined by devicons.
    icon_custom_colors = false,

    -- Configure icons on the bufferline.
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',

    -- If true, new buffers will be inserted at the start/end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = false,
    insert_at_start = false,

    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,

    -- Sets the maximum buffer name length.
    maximum_length = 30,

    -- If set, the letters for each buffer in buffer-pick mode will be
    -- assigned based on their name. Otherwise or in case all letters are
    -- already assigned, the behavior is to assign letters in order of
    -- usability (see order below)
    semantic_letters = true,

    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustement
    -- for other layouts.
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

    -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
    -- where X is the buffer number. But only a static string is accepted here.
    no_name_title = nil
}

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

local hl = require'lualine.utils'.hl
local icons = require 'bufferline.icons'
local fg_target = {cterm = 'red'}
fg_target.gui = fg_target.cterm

local fg_current = hl.fg_or_default({'Normal'}, '#ff0000', 255)
local fg_visible = hl.fg_or_default({'TabLineSel'}, '#ff0000', 255)
local fg_inactive = hl.fg_or_default({'TabLineFill'}, '#ff0000', 102)

local fg_modified = hl.fg_or_default({'WarningMsg'}, '#ff0000', 178)
local fg_special = hl.fg_or_default({'Special'}, '#ff0000', 75)
local fg_subtle = hl.fg_or_default({'NonText', 'Comment'}, '#ff0000', 240)

local bg_current = hl.bg_or_default({'Normal'}, 'none')
local bg_visible = hl.bg_or_default({'TabLineSel', 'Normal'}, 'none')
local bg_inactive = hl.bg_or_default({'TabLineFill', 'StatusLine'}, 'none')

--      Current: current buffer
--      Visible: visible but not current buffer
--     Inactive: invisible but not current buffer
--        -Icon: filetype icon
--       -Index: buffer index
--         -Mod: when modified
--        -Sign: the separator between buffers
--      -Target: letter in buffer-picking mode
hl.set_default('BufferCurrent', bg_current, fg_current)
hl.set_default('BufferCurrentIndex', bg_current, fg_special)
hl.set_default('BufferCurrentMod', bg_current, fg_modified)
hl.set_default('BufferCurrentSign', bg_current, fg_special)
hl.set_default('BufferCurrentTarget', bg_current, fg_target, true)
hl.set_default('BufferInactive', bg_inactive, fg_inactive)
hl.set_default('BufferInactiveIndex', bg_inactive, fg_subtle)
hl.set_default('BufferInactiveMod', bg_inactive, fg_modified)
hl.set_default('BufferInactiveSign', bg_inactive, fg_subtle)
hl.set_default('BufferInactiveTarget', bg_inactive, fg_target, true)
hl.set_default('BufferTabpageFill', bg_inactive, fg_inactive)
hl.set_default('BufferTabpages', bg_inactive, fg_special, true)
hl.set_default('BufferVisible', bg_visible, fg_visible)
hl.set_default('BufferVisibleIndex', bg_visible, fg_visible)
hl.set_default('BufferVisibleMod', bg_visible, fg_modified)
hl.set_default('BufferVisibleSign', bg_visible, fg_visible)
hl.set_default('BufferVisibleTarget', bg_visible, fg_target, true)

hl.set_default_link('BufferCurrentIcon', 'BufferCurrent')
hl.set_default_link('BufferInactiveIcon', 'BufferInactive')
hl.set_default_link('BufferVisibleIcon', 'BufferVisible')
hl.set_default_link('BufferOffset', 'BufferTabpageFill')

icons.set_highlights()
