" Remap escape
inoremap jk <Esc>

" Useful mappings for managing windows
nnoremap vs :vsplit
nnoremap sp :split

" Vertically resize the current window
nnoremap vr :vertical resize
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Remap 0 to first non-blank character
nnoremap 0 ^

" Move the current line up or down
nnoremap <silent> <Esc>j mz:m+<CR>`z
nnoremap <silent> <Esc>k mz:m-2<CR>`z
vnoremap <silent> <Esc>j :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <silent> <Esc>k :m'<-2<cr>`>my`<mzgv`yo`z
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Expand or shrink the current region
nnoremap K <Plug>(expand_region_expand)
nnoremap J <Plug>(expand_region_shrink)

" Source Vim
nnoremap <leader><CR> :source %<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <C-k> :bprev<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-q> :bdelete<CR>

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
