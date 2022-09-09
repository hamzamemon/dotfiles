-- If it is 1, default rules are not available. You can explicitly set default rules by calling |lexima#set_default_rules()|.
vim.g.lexima_no_default_rules = 0

-- lexima.vim defines a insert mode mapping to <Esc> by default. If you don't want to map <Esc>, set this variable to another left-hand-side, or '' to not create a default mapping to |lexima#insmode#escape()|.
vim.g.lexima_map_escape = '<Esc>'

-- 	If it is 1, |lexima-basic-rules| are enabled by default.
vim.g.lexima_enable_basic_rules = 1

-- 	If it is 1, |lexima-newline-rules| are enabled by default.
vim.g.lexima_enable_newline_rules = 1

-- 	If it is 1, |lexima-space-rules| are enabled by default.

vim.g.lexima_enable_space_rules = 1

-- 	If it is 1, |lexima-endwise-rules| are enabled by default.
vim.g.lexima_enable_endwise_rules = 1

-- If it is 1, enables <cr> to be used to accept completions when the |popup-menu| is visible.
vim.g.lexima_accept_pum_with_enter = 1

-- 	If it is 1, <C-h> can be used in the same manner as <BS>.
vim.g.lexima_ctrlh_as_backspace = 0

-- 	If it is 1, all feature of lexima.vim disabled.
vim.g.lexima_disable_on_nofile = 0

-- If it is 1, all of lexima rules are disabled on the buffer. (local to buffer)
vim.b.lexima_disabled = 0
