--------------------------------------------------------------------------------
-- Maintainer:
--   Hamza Memon
--------------------------------------------------------------------------------
-- General mappings
require('general')
require('globals')
require('plugins')
require('keybinds')

-- Force loading of astronauta first.
vim.cmd [[runtime plugin/astronauta.vim]]

-- LSP
require('lsp')

-- Load supplementary Vim files
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
