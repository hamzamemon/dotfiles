-- When this value is set to |v:false|, a popup window is no longer closed automatically when moving a cursor after the window is shown up.
vim.g.git_messenger_close_on_cursor_moved = true

-- When this value is set to |v:true|, a popup window includes diff hunks of the commit by default.
-- Note: Typing 'd' or 'r' in popup window reveals diff hunks even if this value is set to |v:false|.

-- One of 'none', 'current', 'all'. When this value is NOT set to 'none', a popup window includes diff hunks of the commit at showing up. 'current' includes diff hunks of only current file in the commit. 'all' includes all diff hunks in the commit.

-- Note: Typing d/D or r/R mappings in popup window reveal diff hunks even if this value is set to 'none'.
vim.g.git_messenger_include_diff = 'none'

-- 'git' command to retrieve commit messages. If your 'git' executable is not in '$PATH' directories, please specify the path to the executable.
vim.g.git_messenger_git_command = 'git'

-- When this value is set to |v:true|, it does not define any key mappings. <Plug> mappings are still defined since they don't make any conflicts with existing mappings.
vim.g.git_messenger_no_default_mappings = false

-- When this value is set to |v:false|, run |:GitMessenger| or |<plug>(git-messenger)| again after showing a popup does not move the cursor in the window.
vim.g.git_messenger_into_popup_after_show = true

-- When this value is set to |v:true|, the cursor goes into a popup window when running |:GitMessenger| or |<Plug>(git-messenger)|.
vim.g.git_messenger_always_into_popup = false

-- When this variable is set the contents will be appended to the git blame command. Use it to add options (like -w).
vim.g.git_messenger_extra_blame_args = ''

-- Command modifiers for opening preview window. The value will be passed as prefix of |:pedit| command. For example, setting 'botright' to the variable opens a preview window at bottom of the current window. Please see |<mods>| for more details.
-- NOTE: This variable is effective only when opening preview window (on Neovim (0.3.0 or earlier) or Vim).
vim.g.git_messenger_preview_mods = ''

-- Max lines of popup window in an integer value. Setting |v:null| means no limit.
vim.g.git_messenger_max_popup_height = nil

-- Max characters of popup window in an integer value. Setting |v:null| means no limit.
vim.g.git_messenger_max_popup_width = nil

-- String value to format dates in popup window. Please see |strftime()| to know the details of the format.
-- ' Example: '2019 May 26 03:27:43'
-- let g:git_messenger_date_format = '%Y %b %d %X'
vim.g.git_messenger_date_format = '%c'

-- When this value is set to |v:true|, markers for word diffs like '[-', '-]', '{+', '+}' are concealed. Set |v:false| when you don't want to hide them.
-- Note: Word diff is enabled by typing 'r' in a popup window.
vim.g.git_messenger_conceal_word_diff_marker = true

-- Options passed to |nvim_open_win| on opening a popup window. This is useful when you want to override some window options.
-- The following example will add single border line to the window.
-- let g:git_messenger_floating_win_opts = { 'border': 'single' }
vim.g.git_messenger_floating_win_opts = {}

-- Setting |v:true| means adding margins in popup window. Blank lines at the top and bottom of popup content are inserted. And every line is indented with one whitespace character.
-- Setting |v:false| to this variable removes all the margins. Removing margins might be useful when you enable borders of popup window with |g:git_messenger_floating_win_opts|.
vim.g.git_messenger_popup_content_margins = true

-- Keybindings
vim.api
    .nvim_set_keymap('n', '<leader>gm', ':GitMessenger<CR>', {noremap = true})
