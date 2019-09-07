""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/bundle/')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dracula/vim'

" CtrlP/NerdTree
Plug 'ctrlpvim/ctrlp.vim'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree'

" Easier jumping around/editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Development
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
" needs ctags installed
Plug 'majutsushi/tagbar'

" Integration
Plug 'w0rp/ale'
Plug 'chrisbra/csv.vim'

" Misc
Plug 'sjl/gundo.vim'

Plug 'mkitt/tabline.vim'

Plug 'mileszs/ack.vim'


Plug 'tpope/vim-fugitive'


Plug 'Chiel92/vim-autoformat'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'chrisbra/csv.vim'
Plug 'hdima/python-syntax'
Plug 'vim-scripts/c.vim'
Plug 'isruslan/vim-es6'
Plug 'burnettk/vim-angular'


Plug 'terryma/vim-expand-region'

" Install xsel
Plug 'christoomey/vim-system-copy'

Plug 'geoffharcourt/vim-matchit'

Plug 'sickill/vim-pasta'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'drn/zoomwin-vim'


Plug 'xuhdev/SingleCompile'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
endif

Plug 'ervandew/supertab'
Plug 'ternjs/tern_for_vim'
Plug 'Shougo/neco-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


Plug 'terryma/vim-multiple-cursors'

Plug 'valloric/MatchTagAlways'


Plug 'PotatoesMaster/i3-vim-syntax'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
