""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/bundle/')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 15
let g:ctrlp_custom_ignore = '^\.DS_Store\|^\.git\'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize = 35


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Multiple Cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_quit_key = '<Esc>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git Gutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neocomplete/deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect
set shortmess+=c

if has('nvim')
  let g:deoplete#enable_at_startup = 1
  " Shortcut for toggle deocomplete
  noremap <Leader>no :deoCompleteToggle<CR>

  " Use deocomplete
  let g:deocomplete#enable_at_startup = 1

  " Disable delay
  let g:deocomplete#auto_complete_delay = 0

  " Use smartcase
  let g:deocomplete#enable_smart_case = 1

  " Set minimum syntax keyword length
  let g:deocomplete#sources#syntax#min_keyword_length = 3

  " Define dictionary
  let g:deocomplete#sources#dictionary#dictionaries = {
        \ 'default' : ''
        \ }

  " Define keyword
  if !exists('g:deocomplete#keyword_patterns')
    let g:deocomplete#keyword_patterns = {}
  endif
  let g:deocomplete#keyword_patterns['default'] = '\h\w*'

  " SuperTab like snippets behavior
  imap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
  smap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
  " imap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
  " smap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"

  " <CR>: close popup and save indent
  inoremap <silent> <CR> <C-R>=<SID>ClosePopup()<CR>
  function! <SID>ClosePopup()
    return pumvisible() ? "\<C-Y>" : "\<CR>"
  endfunction

  " Undo and manual completion
  inoremap <expr><C-G> deocomplete#undo_completion()
  inoremap <expr><C-L> deocomplete#complete_common_string()

  " Enable heavy omni completion
  if !exists('g:deocomplete#sources#omni#input_patterns')
    let g:deocomplete#sources#omni#input_patterns = {}
  endif
  let g:deocomplete#sources#omni#input_patterns.php = '\h\w\{1,}\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
  let g:deocomplete#sources#omni#input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  let g:deocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  let g:deocomplete#sources#omni#input_patterns.perl = '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

  if !exists('g:deocomplete#force_omni_input_patterns')
    let g:deocomplete#force_omni_input_patterns = {}
  endif

  augroup OmniCompletionSetup
    autocmd!
    autocmd FileType c          set omnifunc=ccomplete#Complete
    autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
    autocmd FileType python     set omnifunc=jedi#completions
    autocmd FileType ruby       set omnifunc=rubycomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType java       set omnifunc=javacomplete#Complete
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
  augroup END

  " Manual omni completion
  inoremap <expr><C-F> deocomplete#start_manual_complete()
else
  "
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=["../UltiSnips"]

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
map <c-o> :UltiSnipsEdit <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto Format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au BufWrite * :Autoformat


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PHP Fixer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Normal plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'NLKNguyen/papercolor-theme'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'yegappan/mru'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

Plug 'bling/vim-bufferline'
Plug 'mkitt/tabline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts', {'do': './install.sh'}
Plug 'tpope/vim-fugitive'
" Plug 'itchyny/lightline.vim'

Plug 'mileszs/ack.vim'

Plug 'sjl/gundo.vim'

Plug 'w0rp/ale'
" let g:ale_set_balloons=1
let g:ale_linters={
      \ 'c': ['cppcheck', 'clang-format'],
      \ 'css': ['stylelint'],
      \ 'html': ['tidy'],
      \ 'javascript': ['eslint'],
      \ 'json': ['jsonlint'],
      \ 'php': ['phpcs', 'phpmd'],
      \ 'python': ['flake8'],
      \ 'vim': ['vint'],
      \}
nmap <silent> <F2> <Plug>(ale_next_wrap)

Plug 'stephpy/vim-php-cs-fixer'
Plug 'Chiel92/vim-autoformat'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'moll/vim-node'
Plug 'chrisbra/csv.vim'
Plug 'hdima/python-syntax'
Plug 'vim-scripts/c.vim'
Plug 'isruslan/vim-es6'
Plug 'burnettk/vim-angular'


Plug 'terryma/vim-expand-region'
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Install xsel
Plug 'christoomey/vim-system-copy'

Plug 'geoffharcourt/vim-matchit'

Plug 'sickill/vim-pasta'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

Plug 'drn/zoomwin-vim'

Plug 'xuhdev/SingleCompile'
nmap <F8> :SCCompile<CR>
nmap <F9> :SCCompileRun<CR>

if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/neocomplete.nvim'
endif

Plug 'ervandew/supertab'
Plug 'ternjs/tern_for_vim'
Plug 'artur-shaik/vim-javacomplete2'
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
let g:cssColorVimDoNotMessMyUpdatetime = 1

Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,angularjs,angularui,react,d3,vue'

Plug 'PotatoesMaster/i3-vim-syntax'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
