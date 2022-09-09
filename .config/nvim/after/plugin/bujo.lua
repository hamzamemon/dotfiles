-- Set cache directory
vim.cmd('let g:bujo#todo_file_path = $HOME . "/.cache/bujo"')

-- Set window width
vim.cmd('let g:bujo#window_width = 45')

-- Key maps
vim.api.nvim_set_keymap('n', '<leader>to', ':Todo<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>th', '<Plug>BujoAddnormal',
                        {noremap = false})
vim.api.nvim_set_keymap('n', '<leader>tu', '<Plug>BujoChecknormal',
                        {noremap = false})
