--------------------------------------------------------------------------------
-- Maintainer:
--   Hamza Memon
--------------------------------------------------------------------------------
-- Install plugins
require 'hamzamemon.plugins'

-- Adjust general settings
require 'hamzamemon.general'

-- Autoload all Lua files under ./lua/hamzamemon/plugin
vim.o.runtimepath = vim.o.runtimepath .. ',~/.config/nvim/lua/hamzamemon/'

-- LSP
require 'hamzamemon.lsp'

-- Set keybindings
require "hamzamemon.keybinds"
