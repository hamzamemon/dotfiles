" Turn Powerline fonts on
let g:airline_powerline_fonts = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Turn off spelling piece
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_section_x = ''
au VimEnter * let g:airline_section_x = airline#section#create_right(['tagbar']) | :AirlineRefresh

let w:airline_skip_empty_sections = 1
let g:airline_highlighting_cache = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_y = '%3l/%L'
let g:airline_section_z = '%3v'

let g:airline_extensions = ['default', 'branch', 'tabline', 'tagbar', 'whitespace', 'ale', 'ctrlp', 'csv', 'hunks']

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#format = 1

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab<Paste>

let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#show_line_numbers = 1

let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'

let g:airline#extensions#csv#enabled = 1

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']



hi Normal             ctermbg=NONE
hi Statement          ctermbg=NONE
hi Title              ctermbg=NONE
hi Todo               ctermbg=NONE
hi Underlined         ctermbg=NONE
hi ErrorMsg           ctermbg=NONE
hi LineNr             ctermbg=NONE

" tmuxline???
" WindowSwap??

" defaults
" let g:airline_detect_paste = 1
" let g:airline_detect_crypt = 1
" let g:airline_detect_iminsert = 0
" let g:airline_inactive_collapse = 1
