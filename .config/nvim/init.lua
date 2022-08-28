--------------------------------------------------------------------------------
-- Maintainer:
--   Hamza Memon
--------------------------------------------------------------------------------
-- Install plugins
require 'hamzamemon.plugins'

-- Adjust general settings
require 'hamzamemon.general'

-- Autoload all Lua files under ./lua/hamzamemon/
vim.o.runtimepath = vim.o.runtimepath .. ',~/.config/nvim/lua/hamzamemon/'

-- require 'hamzamemon.keybinds'

-- LSP
require 'hamzamemon.lsp'

-- Load supplementary Vim files
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
