" Enable syntax highlighting
syntax enable

" Enable filetype plugins
filetype plugin indent on

" Auto indent current line when starting a new line
set autoindent

" Auto read a file if it has been changed from outside of Vim
set autoread

" Use dark background theme
set background=dark

" Changes behavior of <BS>, <Del>, Ctrl+W and Ctrl+U in Insert mode
set backspace="indent,eol,start"

" List of directories for the backup file
set backupdir="~/.local/share/nvim/backup"

" Bell will not be rung for these events
set belloff="all"

" Specifies how insert mode completion works with Ctrl+P or Ctrl+N are used
set complete=".,w,b,u,t"

" List of directories for the swap file
set directory="~/.local/share/nvim/swap//"

" Change the way text is displayed
set display="lastline,msgsep"

" String encoding
set encoding="utf-8"

" Characters to fill the status lines and vertical separators
set fillchars=""

" Describes how automatic formatting is done
set formatoptions="tcqj"

" If on, flushes file to disk after saving a file, ensuring it is safely written
" Can cause slow down when writing buffer, closing Vim and other operations
set nofsync

" Number of lines of history to remember
set history=10000

" Highlight search results
set hlsearch

" Show pattern matches as it is being typed
set incsearch

" Whether \"langmap\" applies to characters from a mapping or not
set nolangremap

" Always show the status line
set laststatus=2

" Strings to use in \"list\" mode
set listchars="tab:> ,trail:-,nbsp:+"

" Bases to be considered when using Ctrl+A and Ctrl+X
set nrformats="bin,hex"

" Show line and column number of cursor position
set ruler

" Changes the \"mksession\" command
set sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize"

" Avoid all Enter prompts caused by file messages (like Ctrl+G)
set shortmess="filnxtToOF"

" Show (partial) commands in the last line of the screen
set showcmd

" Minimal number of columns to scroll horizontally
set sidescroll=1

" Inserts blanks according to \"shiftwidth\"
set smarttab

" Keeps cursor in the same column
" Applies to commands: Ctrl+D, Ctrl+U, Ctrl+B, Ctrl+FF, G, H, M, L, gg, dX, <<X, >>X
set nostartofline

" Maximum number of tab pages to be opened by the \"-p\" argument
set tabpagemax=50

" Filenames for the \"tag\" command
set tags="./tags;,tags"

" Time in milliseconds to wait for a key code sequence to complete
set ttimeoutlen=50

" List of directory names for undo files
set undodir="~/.local/nvim/undo"

" Enables enhanced menu for command line completion where possible matches are
" shown in a menu after hitting Tab
set wildmenu

" List of words that change how command line completion is done
set wildoptions="pum,tagfile"
