-- Horizontal width of the graph and preview
vim.g.gundo_width = 60

-- Vertical height of the preview
vim.g.gundo_preview_height = 20

-- Force the preview window below current windows instead of below the graph, giving the preview window more space to show the unified diff
vim.g.gundo_preview_bottom = 1

-- Hide the help text
vim.g.gundo_help = 0

-- Automatically close window when reverting
vim.g.gundo_close_on_revert = 1

-- Keep focus in the window when reverting
vim.g.gundo_return_on_revert = 0

-- Use Python 3 instead of Python 2
vim.g.gundo_prefer_python3 = 1

vim.api.nvim_set_keymap('n', '<F5>', ':GundoToggle<CR>', {noremap = true})
