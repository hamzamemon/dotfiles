" Layout
let g:fzf_layout = {
    \ 'up':'~90%',
    \ 'window': {
    \   'width': 0.8,
    \   'height': 0.8,
    \   'yoffset':0.5,
    \   'xoffset': 0.5,
    \   'highlight': 'Todo',
    \   'border': 'sharp'
    \ }
\ }

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
\ }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_buffers_jump = 1

let g:fzf_branch_actions = {
    \ 'rebase': {
    \   'prompt': 'Rebase> ',
    \   'execute': 'echo system("{git} rebase {branch}")',
    \   'multiple': v:false,
    \   'keymap': 'ctrl-r',
    \   'required': ['branch'],
    \   'confirm': v:false,
    \ },
    \ 'track': {
    \   'prompt': 'Track> ',
    \   'execute': 'echo system("{git} checkout --track {branch}")',
    \   'multiple': v:false,
    \   'keymap': 'ctrl-t',
    \   'required': ['branch'],
    \   'confirm': v:false,
    \ },
\ }

map <C-f> :Files<CR>
nnoremap <leader>rg :Rg<CR>

if executable('rg')
  let g:rg_derive_root='true'
endif

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

 " Make Ripgrep ONLY search file contents and not filenames
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  \   <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
