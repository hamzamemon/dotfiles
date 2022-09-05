M = {}
local opts = {noremap = true, silent = true}
local opts_noremap = {noremap = true}

local term_opts = {silent = true}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Source Vim
keymap('n', '<leader><CR>', ':source %<CR>', opts)

-- Remap escape
keymap('n', 'jk', '<ESC>', opts_noremap)

-- Remap 0 to first non-blank character
keymap('n', '0', '^', opts)

-- Useful mappings for managing windows
keymap('n', 'vs', ':vsplit ', opts_noremap)
keymap('n', 'sp', ':split ', opts_noremap)

-- Vertically resize the current window
keymap('n', 'vr', ':vertical resize ', opts_noremap)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Smart way to move between windows
keymap('n', '<C-j>', '<C-W>j', opts_noremap)
keymap('n', '<C-k>', '<C-W>k', opts_noremap)
keymap('n', '<C-h>', '<C-W>h', opts_noremap)
keymap('n', '<C-l>', '<C-W>l', opts_noremap)
keymap('n', '<leader>h', ':wincmd h<CR>', opts_noremap)
keymap('n', '<leader>j', ':wincmd j<CR>', opts_noremap)
keymap('n', '<leader>k', ':wincmd k<CR>', opts_noremap)
keymap('n', '<leader>l', ':wincmd l<CR>', opts_noremap)

-- Insert --
-- Remap escape
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap('v', 'J', ':m \'>+1<CR>gv=gv', opts_noremap)
keymap('v', 'K', ':m \'<-2<CR>gv=gv', opts_noremap)

keymap("n", "<F6>",
       [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
       opts)

M.show_documentation = function()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({"vim", "help"}, filetype) then
        vim.cmd("h " .. vim.fn.expand "<cword>")
    elseif vim.tbl_contains({"man"}, filetype) then
        vim.cmd("Man " .. vim.fn.expand "<cword>")
    else
        vim.lsp.buf.hover()
    end
end
vim.api.nvim_set_keymap("n", "K",
                        ":lua require('hamzamemon.keymaps').show_documentation()<CR>",
                        opts)

keymap("n", "<c-l>", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)

return M
