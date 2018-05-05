let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
scriptencoding utf-8
let g:ale_sign_warning = ''

highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s %severity%'

" let g:ale_set_balloons=1
let g:ale_linters={
      \ 'c': ['cppcheck', 'clang', 'gcc'],
      \ 'css': ['csslint', 'stylelint'],
      \ 'html': ['tidy', 'proselint'],
      \ 'javascript': ['eslint'],
      \ 'json': ['jsonlint'],
      \ 'markdown': ['proselint'],
      \ 'python': ['flake8', 'pycodestyle'],
      \ 'vim': ['vint'],
      \}
