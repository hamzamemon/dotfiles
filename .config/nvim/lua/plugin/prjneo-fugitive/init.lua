vim.api.nvim_set_keymap('n', '<leader>ga', ':Git add %:p<CR><CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gs', ':Gstatus<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit -v -q<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gt', ':Gcommit -v -q %:p<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiff<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gb', ':GBranches', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gf', ':diffget //3', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gj', ':diffget //2', {noremap = true})
