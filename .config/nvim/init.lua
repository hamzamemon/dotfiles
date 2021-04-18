--------------------------------------------------------------------------------
-- Maintainer:
--   Hamza Memon
--------------------------------------------------------------------------------
if require('initial')() then
  return
end

-- General mappings
require('general')

-- Load supplementary Vim files
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
