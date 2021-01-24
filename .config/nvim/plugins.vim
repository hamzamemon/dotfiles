""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged/')

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schemes
Plug 'dracula/vim'

" Status bar
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Development
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-dispatch'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-angular'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-packer.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'

" FZF
" install fzf, ripgrep, the_silver_searcher and fd packages
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
Plug 'stsewd/fzf-checkout.vim'

" Quality of life
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/tagalong.vim'

" Colors
Plug 'luochen1990/rainbow'
Plug 'norcalli/nvim-colorizer.lua'

" Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" LaTeX
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

" Miscellaneous
Plug 'vuciv/vim-bujo'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(69) } }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
