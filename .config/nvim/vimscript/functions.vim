""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocmds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun TrimWhitespace()
  local l:save = winsaveview()
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
