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

" Easier jumping around/editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Vim statusline
Plug 'bling/vim-bufferline'
Plug 'mkitt/tabline.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

Plug 'mileszs/ack.vim'

Plug 'sjl/gundo.vim'

Plug 'w0rp/ale'

Plug 'Chiel92/vim-autoformat'
Plug 'pangloss/vim-javascript'
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

Plug 'airblade/vim-gitgutter'

Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'

Plug 'majutsushi/tagbar'

Plug 'plasticboy/vim-markdown'

Plug 'valloric/MatchTagAlways'
Plug 'hail2u/vim-css3-syntax'
Plug 'skammer/vim-css-color'

Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,angularjs,angularui,react,d3,vue'

Plug 'PotatoesMaster/i3-vim-syntax'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
