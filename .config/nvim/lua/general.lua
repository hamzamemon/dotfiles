--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------
-- Automatically write if modified for commands like :next, :make and :stop
vim.o.autowrite = true

-- Allows for extra key combinations
vim.g.mapleader = ' '

-- Spelling
vim.wo.spell = true
vim.bo.spelllang = "en_us"

-- Disable making a backup before overwriting a file
vim.o.backup = false
vim.o.writebackup = false

-- Milliseconds of waiting if nothing is typed to write swap file to disk
vim.o.updatetime = 300

-- Required to keep multiple buffers open
vim.o.hidden = true

-- Don't redraw while executing macros (good performance config)
vim.o.lazyredraw = true

-- Move to next line with these keys
vim.o.whichwrap = vim.o.whichwrap .. ',<,>,[,],h,l'

-- Allow for copy and pasting from clipboard
vim.o.clipboard = "unnamedplus"

-- Horizontal splits will automatically be below
vim.o.splitbelow = true

-- Vertical splits will automatically be to the right
vim.o.splitright = true

-- Keeps cursor in the middle of screen
vim.o.scrolloff = 999

-- Time in milliseconds to wait for a mapped sequence to complete
vim.o.timeoutlen = 100


--------------------------------------------------------------------------------
-- Front-end
--------------------------------------------------------------------------------
-- Enables line numbering
vim.wo.number = true

-- Enables relative numbering
vim.wo.relativenumber = true

-- The sign column will appear if there are signs to show
vim.wo.signcolumn = "yes"

-- Show matching brackets when text indicator is over them
vim.o.showmatch = true

-- Number of tenths of a second to blink when matching brackets
vim.o.matchtime = 2

-- Add less than and greater than sign as pairs to make jumping easier with '%'
vim.bo.matchpairs = vim.bo.matchpairs .. ',<:>'

-- Folding
vim.wo.foldenable = true
vim.o.foldlevelstart = 5
vim.wo.foldmethod = "syntax"
vim.cmd('set foldopen-=block')
vim.wo.foldcolumn = "1"

-- Text is shown normally
vim.wo.conceallevel = 0

-- Remove messages like "-- INSERT --" if in Insert, Replace or Visual modes
vim.o.showmode = false

-- Number of spaces to be used if typing a Tab
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.smartindent = true
vim.bo.expandtab = true

-- Show line break column
vim.wo.linebreak = true
vim.bo.textwidth = 80
vim.wo.colorcolumn = "80"

-- Do not wrap lines
vim.wo.wrap = false

-- Enable highlighting of the current line
vim.wo.cursorline = true


--------------------------------------------------------------------------------
-- Command line, completion and wild menu
--------------------------------------------------------------------------------
-- Number or lines for displaying messages in the command line
vim.o.cmdheight = 2

-- Options for insert mode completion
vim.o.completeopt = 'menu,preview,noinsert,noselect'

-- Turn on the wild menu
vim.o.wildmode = 'longest,list,full'

-- Ignore files
vim.o.wildignore = vim.o.wildignore .. '*.o,*~,*.pyc,*/.git/*,*/.DS_Store,*/node_modules/*'

-- Makes popup menu smaller
vim.o.pumheight = 10

-- Always show tabs
vim.o.showtabline = 2

-- Do not show insertion completion menu messages
vim.o.shortmess = vim.o.shortmess .. 'c'


--------------------------------------------------------------------------------
-- Search
--------------------------------------------------------------------------------
-- Ignore case when searching
vim.o.ignorecase = true

-- When searching, try to be be smart about cases
vim.o.smartcase = true

-- Changes special characters that can be used in search patterns
vim.o.magic = true

-- Stop highlighting after searching
vim.o.hlsearch = false

-- Keywords used when searching and recognizing commands
vim.bo.iskeyword = vim.bo.iskeyword .. ',@-@'


--------------------------------------------------------------------------------
-- Background
--------------------------------------------------------------------------------
-- Enable 256 colors palette
vim.o.t_Co = "256"

-- Enables 24-bit RGB colors that most terminals support
vim.o.termguicolors = true

-- Use dracula theme
vim.cmd('colorscheme dracula')

-- Remove background
vim.cmd('highlight Normal guibg=none')
