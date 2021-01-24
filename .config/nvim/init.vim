source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/keybinds.vim
luafile ~/.config/nvim/lua/nvim-colorizer.lua
luafile ~/.config/nvim/lua/treesitter.lua
luafile ~/.config/nvim/lua/devicons.lua

if !has('nvim')
	source ~/.config/nvim/neovim_defaults.vim
endif
