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
