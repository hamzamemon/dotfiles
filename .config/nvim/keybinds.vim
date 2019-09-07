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

" Remap Vim 0 to first non-blank character
map 0 ^

nmap <silent> <Esc>j mz:m+<CR>`z
nmap <silent> <Esc>k mz:m-2<CR>`z
vmap <silent> <Esc>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <silent> <Esc>k :m'<-2<cr>`>my`<mzgv`yo`z

" NerdTree
map <leader>nn :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Ack
nnoremap <leader>a :Ack!<Space>

" UltiSnips
map <C-o> :UltiSnipsEdit<CR>

" Git Gutter
nnoremap <silent> <leader>g :GitGutterToggle<CR>

nmap tb :TagbarToggle<CR>

nmap <silent> <F2> <Plug>(ale_next_wrap)

map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

nmap <F8> :SCCompile<CR>
nmap <F9> :SCCompileRun<CR>
