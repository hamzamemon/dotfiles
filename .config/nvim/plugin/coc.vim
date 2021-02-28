" Use Alt-Tab for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <buffer> <silent><expr> <M-TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<M-TAB>" :
  \ coc#refresh()

" Use Ctrl Space for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Use shift tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Confirm completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute 'h ' . expand('<cword>')
  elseif &filetype ==# 'tex'
    VimtexDocPackage
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup MyCocGroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
nmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)

" Use <Tab> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" List of extensions to install
let g:coc_global_extensions = [
  \ 'coc-angular',
  \ 'coc-bootstrap-classname',
  \ 'coc-css',
  \ 'coc-docker',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-fzf-preview',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-java-debug',
  \ 'coc-json',
  \ 'coc-lua',
  \ 'coc-markdownlint',
  \ 'coc-prettier',
  \ 'coc-pyright',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-vimtex',
  \ 'coc-xml'
  \ ]

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

nmap <leader>e :CocCommand explorer<CR>
nmap <leader>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
