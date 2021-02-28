" Powerline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'dracula'

" Airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" Turn off spelling piece
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0

" Do not draw separators for empty sections
let g:airline_skip_empty_sections = 1
let w:airline_skip_empty_sections = 1

" Skip displaying file format output
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'

" Tagbar, filetype, virtualenv
let g:airline_section_x = ''

" File encoding, file format
let g:airline_section_y = '%3l/%L'

" Percentage, line number, column number
let g:airline_section_z = '%3v'

let g:airline_extensions = [
  \ 'branch',
  \ 'coc',
  \ 'fzf',
  \ 'hunks',
  \ 'undotree',
  \ 'vimtex',
  \ 'whitespace'
  \ ]
