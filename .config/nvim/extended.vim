""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap Vim 0 to first non-blank character
map 0 ^

nmap <silent> <Esc>j mz:m+<CR>`z
nmap <silent> <Esc>k mz:m-2<CR>`z
vmap <silent> <Esc>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <silent> <Esc>k :m'<-2<cr>`>my`<mzgv`yo`z


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim/undodir
  set undofile
catch
endtry
