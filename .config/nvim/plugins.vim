""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/bundle/')


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

" Jumping around files
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Development
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'valloric/MatchTagAlways'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Easier jumping around/editing
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" Miscellaneous
Plug 'chrisbra/csv.vim'
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-system-copy'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
