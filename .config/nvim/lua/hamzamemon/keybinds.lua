-- Remap escape
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true})

-- Useful mappings for managing windows
vim.api.nvim_set_keymap('n', 'vs', ':vsplit', {noremap = true})
vim.api.nvim_set_keymap('n', 'sp', ':split', {noremap = true})

-- Vertically resize the current window
vim.api.nvim_set_keymap('n', 'vr', ':vertical resize', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>+', ':vertical resize +5<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>-', ':vertical resize -5<CR>',
                        {noremap = true})

-- Smart way to move between windows
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', {noremap = true})

-- Remap 0 to first non-blank character
vim.api.nvim_set_keymap('n', '0', '^', {noremap = true})

-- Move the current line up or down
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true})

-- Expand or shrink the current region
vim.api.nvim_set_keymap('n', 'J', '<Plug>(expand_region_shrink)',
                        {noremap = true})
vim.api.nvim_set_keymap('n', 'K', '<Plug>(expand_region_expand)',
                        {noremap = true})

-- Source Vim
vim.api.nvim_set_keymap('n', '<leader><CR>', ':source %<CR>', {noremap = true})
