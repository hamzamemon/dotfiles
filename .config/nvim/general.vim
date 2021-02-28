""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Hamza Memon
"
" Version:
"   4.0 - 2/27/21
"
" Sections:
"   -> General
"   -> Front-end
"   -> Command line, completion and wild menu
"   -> Search
"   -> Background
"   -> General Autocmds
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically write if modified for commands like :next, :make and :stop
set autowrite

" Allows for extra key combinations
let g:mapleader = ' '

" Spelling
set spell
set spelllang=en_us

" Directory for undo files
set undodir=~/.config/nvim/undodir
set undofile
" set noswapfile

" Disable making a backup before overwriting a file
set nobackup
set nowritebackup

" Milliseconds of waiting if nothing is typed to write swap file to disk
set updatetime=200

" Hide buffer when it has been abandoned
set hidden

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Allow for copy and pasting from clipboard
set clipboard=unnamedplus

" Horizontal splits will automatically be below
set splitbelow

" Vertical splits will automatically be to the right
set splitright

" Do not wrap lines
set nowrap

" Keeps cursor in the middle of screen
set scrolloff=999


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Front-end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enables line numbering
set number

" Enables relative numbering
set relativenumber

" By default the sign column will appear if there are signs to show
set signcolumn=yes

" Show matching brackets when text indicator is over them
set showmatch

" Number of tenths of a second to blink when matching brackets
set matchtime=2

" Folding
set foldenable
set foldlevelstart=5
set foldmethod=syntax
set foldopen-=block
set foldcolumn=1

" Remove messages like \"-- INSERT --\" if in Insert, Replace or Visual modes
set noshowmode

" Number of spaces to be used if typing a Tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set showtabline=4
set smartindent
set expandtab

" Show line break column
set linebreak
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=grey


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command line, completion and wild menu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Number or lines for displaying messages in the command line
set cmdheight=2

" Options for insert mode completion
set completeopt=menu,noinsert,noselect,preview

" Turn on the wild menu
set wildmode=longest,list,full

" Ignore files
set wildignore+=*.o,*~,*.pyc,*/.git/*,*/.DS_Store,*/node_modules/*

" Do not show insertion completion menu messages
set shortmess+=c


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching, try to be be smart about cases
set smartcase

" Changes special characters that can be used in search patterns
set magic

" Stop highlighting after searching
set nohlsearch

" Keywords used when searching and recognizing commands
set iskeyword+=@-@


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Background
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colors palette
set t_Co=256

" Enables 24-bit RGB color
set termguicolors

" Use dracula theme
colorscheme dracula

" Remove background
highlight Normal guibg=none


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocmds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

function! GoToLastPosition() abort
  if line("'\"") <= 0 || line("'\"") > line('$')
    return
  endif

  normal! g`"
  if &foldlevel == 0
    normal! zMzvzz
  endif
endfunction

augroup MY_GENERAL_GROUP
    autocmd!

    " Trim whitespace
    autocmd BufWritePre * :call TrimWhitespace()

    " Return to last edit position when opening files
    autocmd BufReadPost * :call GoToLastPosition()

    " Close preview window when completion is done
    autocmd CompleteDone * if pumvisible() == 0 | silent! pclose | endif
augroup END
