-- Ack.vim-inspired mappings available only in location/quickfix windows:
-- s - open entry in a new horizontal window
-- v - open entry in a new vertical window
-- t - open entry in a new tab
-- o - open entry and come back
-- O - open entry and close the location/quickfix window
-- p - open entry in a preview window
vim.g.qf_mapping_ack_style = 1

-- Open the quickfix window at the bottom of the screen.
vim.g.qf_window_bottom = 1

-- Open location list windows at the bottom of the screen.
vim.g.qf_loclist_window_bottom = 1

-- It is possible to define what comes before and after the default information displayed in the |'statusline'|.
vim.g.qf_statusline = {}

-- Open the quickfix window automatically if there are any errors.
vim.g.qf_auto_open_quickfix = 1

-- Open the location window automatically if there are any locations.
vim.g.qf_auto_open_loclist = 1

-- Automatically adjust the height of location/quickfix windows to 10 lines (Vim's default) or to the number of items in the list if that number is inferior to 10.
vim.g.qf_auto_resize = 1

-- Define the maximum height of location/quickfix windows.
vim.g.qf_max_height = 10

-- Automatically quit Vim if the quickfix window is the last window.
vim.g.qf_auto_quit = 1

-- Determines what fields to filter on. Possible values are:
-- `0` ........ filter on the buffer name AND the text (default)
-- `1` ........ filter ONLY on the buffer name
-- `2` ........ filter ONLY on the text
vim.g.qf_bufname_or_text = 0

-- Save the view of the current window when toggling location/quickfix window.
vim.g.qf_save_win_view = 1

-- Enables or disables soft-wrapping in the location/quickfix window.
-- 1 - Disables
-- 0 - Enables
vim.g.qf_nowrap = 0

-- With the option set to `0` (vanilla Vim):
-- > very/long/path/with/lots/of/subdirectories/filename.ext|87 col 22| …
-- With the option set to `1` (vim-qf default):
-- > v/l/p/w/l/o/s/filename.ext|87 col 22| …
-- With the option set to `3` (Vim v8.2.1741 or above):
-- > ver/lon/pat/wit/lot/of/sub/filename.ext|87 col 22| …
vim.g.qf_shorten_path = 3
