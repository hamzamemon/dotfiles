vim.g.matchup_enabled = 1
vim.g.matchup_mappings_enabled = 1
vim.g.matchup_matchparen_enabled = 1
vim.g.matchup_motion_enabled = 1
vim.g.matchup_text_obj_enabled = 1
vim.g.matchup_text_obj_enabled = 0
vim.g.matchup_delim_stopline = 1500
vim.g.matchup_delim_noskips = 0
vim.g.matchup_delim_nomids = 0
vim.g.matchup_delim_start_plaintext = 1

vim.b.matchup_matchparen_enabled = undefined
vim.b.matchup_matchparen_fallback = undefined
vim.g.matchup_matchparen_singleton = 0

-- Show if open/close match would have been highlighted if offscreen 
vim.g.matchup_matchparen_offscreen = {
    method = 'popup',
    scrolloff = 0,
    fullwidth = 0,
    highlight = 'OffscreenPopup',
    syntax_hl = 0,
    border = 0
}
vim.g.matchup_matchparen_stopline = 400
vim.g.matchup_matchparen_timeout = 300
vim.g.matchup_matchparen_insert_timeout = 60
vim.b.matchup_matchparen_timeout = 300
vim.b.matchup_matchparen_insert_timeout = 60
vim.g.matchup_matchparen_deferred = 0
vim.g.matchup_matchparen_deferred_show_delay = 50
vim.g.matchup_matchparen_deferred_hide_delay = 700
vim.g.matchup_matchparen_deferred_fade_time = 0
vim.g.matchup_matchparen_pumvisible = 1
vim.g.matchup_matchparen_nomode = ''
vim.g.matchup_matchparen_hi_surround_always = 0
vim.g.matchup_matchparen_hi_background = 0
vim.g.matchup_motion_override_Npercent = 6
vim.g.matchup_motion_cursor_end = 1
vim.g.matchup_delim_count_fail = 0
vim.g.matchup_text_obj_linewise_operators = [['d', 'y']]
vim.g.matchup_surround_enabled = 1
vim.g.matchup_matchpref = {html = {nolists = 0, tagnameonly = 0}}
