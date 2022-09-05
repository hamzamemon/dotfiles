local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then return end

local l_status_ok, session_lens = pcall(require, "session-lens")
if not l_status_ok then return end

local opts = {
    log_level = "info",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = nil,
    auto_restore_enabled = nil,
    auto_session_suppress_dirs = {os.getenv "HOME"},
    auto_session_use_git_branch = nil,
    -- the configs below are lua only
    bypass_session_save_file_types = {},
    cwd_change_handling = { -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
        restore_upcoming_session = true, -- boolean: restore session for upcoming cwd on cwd change
        pre_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
        post_cwd_changed_hook = nil -- function: This is called after auto_session code runs for the `DirChanged` autocmd
    }
}

vim.o.sessionoptions =
    "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

session_lens.setup {
    path_display = {"shorten"},
    -- theme_conf = { border = false },
    previewer = true,
    prompt_title = "Sessions"
}

auto_session.setup(opts)
