" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" Enables syntax highlighting for NGDocs
let g:javascript_plugin_ngdoc = 1

" Enables syntax highlighting for Flow
let g:javascript_plugin_flow = 1

" Customize concealing characters
map <leader>co :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
let g:javascript_conceal_function             = 'ƒ'
let g:javascript_conceal_null                 = 'ø'
let g:javascript_conceal_this                 = '@'
let g:javascript_conceal_return               = '⇚'
let g:javascript_conceal_undefined            = '¿'
let g:javascript_conceal_NaN                  = 'ℕ'
let g:javascript_conceal_prototype            = '¶'
let g:javascript_conceal_static               = '•'
let g:javascript_conceal_super                = 'Ω'
let g:javascript_conceal_arrow_function       = '⇒'
let g:javascript_conceal_noarg_arrow_function = '🞅'
let g:javascript_conceal_underscore_arrow_function = '🞅'
