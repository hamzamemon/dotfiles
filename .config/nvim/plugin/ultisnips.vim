" Directory for snippets
let g:UltiSnipsSnippetDirectories=["../UltiSnips"]

" Key bindings for \"UltiSnipsExpandTrigger\"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Direction to split the window
let g:UltiSnipsEditSplit="vertical"

" Edit list of snippets
map <leader>u :UltiSnipsEdit<CR>
