--------------------------------------------------------------------------------
-- Maintainer:
--   Hamza Memon
--------------------------------------------------------------------------------
if require('initial')() then return end

-- General mappings
require('general')
require('plugins')

-- Force loading of astronauta first.
vim.cmd [[runtime plugin/astronauta.vim]]

-- LSP
require('lsp')

-- Load supplementary Vim files
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
