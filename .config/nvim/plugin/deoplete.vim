set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect
set shortmess+=c

let g:deoplete#enable_at_startup = 1

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
let g:deocomplete#sources#omni#input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

if !exists('g:deocomplete#force_omni_input_patterns')
  let g:deocomplete#force_omni_input_patterns = {}
endif

augroup OmniCompletionSetup
  autocmd!
  autocmd FileType c          set omnifunc=ccomplete#Complete
  autocmd FileType python     set omnifunc=jedi#completions
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType java       set omnifunc=javacomplete#Complete
  autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
augroup END

" Manual omni completion
inoremap <expr><C-F> deocomplete#start_manual_complete()
