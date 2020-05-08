" Remap escape
imap jk <Esc>

" Disable highlight when <leader><space> is pressed
map <silent> <leader><space> :noh<CR>

" Useful mappings for managing windows
map vs :vsplit
map sp :split

" Vertically resize the current window
map vr :vertical resize

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap Vim 0 to first non-blank character
map 0 ^

" Move the current line up or down
nmap <silent> <Esc>j mz:m+<CR>`z
nmap <silent> <Esc>k mz:m-2<CR>`z
vmap <silent> <Esc>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <silent> <Esc>k :m'<-2<cr>`>my`<mzgv`yo`z

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

" Ack
nnoremap <leader>s :Ack!<Space>

" UltiSnips
map <leader>u :UltiSnipsEdit<CR>

" Move to next ALE issue
nmap <silent> <F2> <Plug>(ale_next_wrap)

" Expand or shrink the current region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Source Vim
nnoremap <leader>sv :source %<CR>
