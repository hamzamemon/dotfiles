""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Hamza Memon
"
" Version:
"   1.0 - 8/22/17
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
let mapleader = ","
let g:mapleader = ","

" Add persistent undoing
set undofile

" Source Vim
nnoremap <leader>sv :source $MYVIMRC<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set line number
set number

" Toggle relative numbering
set rnu

" Turn on the Wild menu
set wildmode=longest:full,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.DS_Store
" Height of the command bar

set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

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
set mat=2

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

colorscheme PaperColor
set background=dark

" Set UTF-8 as standard encoding and en_US as the standard language
set encoding=utf8


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
set lbr
set tw=100

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

set scrolloff=999


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap escape
imap jk <Esc>

" Disable highlight when <leader><space> is pressed
map <silent> <leader><space> :noh<CR>

" Useful mappings for managing windows
map vs :vsplit
map sp :split

map vr :vertical resize
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Useful mappings for managing tabs

map tn :tabnew<CR>
map to :tabonly<CR>
map tc :tabclose<CR>
map tm :tabmove<CR>
map tt :tabnext<CR>
map tp :tabprev<CR>
map tf :tabfind
nnoremap <silent> <Esc>h :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <Esc>l :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spell
set spelllang=en_us
