" let g:ale_set_balloons=1
let g:ale_linters={
      \ 'c': ['cppcheck', 'clang-format'],
      \ 'css': ['stylelint'],
      \ 'html': ['tidy'],
      \ 'javascript': ['eslint'],
      \ 'json': ['jsonlint'],
      \ 'python': ['flake8'],
      \ 'vim': ['vint'],
      \}
