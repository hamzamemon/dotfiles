""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Java
"
" Version:
"   1.0 - 8/4/18
"
" Sections:
"   -> General
"   -> Vim user interface
"   -> Colors and Fonts
"   -> Text, tab and indent related
"   -> Moving around, tabs and buffers
"   -> Spell checking
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically save before commands like :next
set autowrite

" With a map leader, it's possible to do extra key combinations
let g:mapleader = ','

" Add persistent undoing
try
  set undodir=~/.config/nvim/undodir
  set undofile
catch
endtry

" Source Vim
nnoremap <leader>sv :source $MYVIMRC<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set line number
set number

" Toggle relative numbering
set relativenumber

" Turn on the Wild menu
set wildmode=longest:full,full

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc,*/.git/*,*/.DS_Store

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching, try to be be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regex, turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Folding
set foldenable
set foldlevelstart=10
set foldmethod=syntax
set foldopen-=block
set foldcolumn=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colors palette
set t_Co=256

" Use dracula theme
colorscheme dracula

" Set UTF-8 as standard encoding and en_US as the standard language
set encoding=utf-8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set showtabline=2

" Linebreak on 100 characters
set linebreak
set textwidth=100
set colorcolumn=100

" Wrap lines
set wrap

" Keep cursor in middle of screen
set scrolloff=999


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell
set spelllang=en_us
