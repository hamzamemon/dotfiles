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

keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
keymap("n", "<F3>", ":e .<cr>", opts)
keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
keymap("n", "<F6>",
       [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
       opts)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)
keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
-- keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
keymap("n", "<c-n>", ":e ~/Notes/<cr>", opts)

-- keymap("n", "<C-\\>", "<cmd>vsplit<cr>", opts)
-- vim.cmd[[nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]]
-- vim.cmd[[nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]]
-- keymap("n", "c*", [[/\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]], opts)
-- keymap("n", "c#", [[?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]], opts)
-- keymap("n", "gx", [[:execute '!brave ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
keymap("n", "gx",
       [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]],
       opts)
-- Change '<CR>' to whatever shortcut you like :)
-- vim.api.nvim_set_keymap("n", "<CR>", "<cmd>NeoZoomToggle<CR>", { noremap = true, silent = true, nowait = true })

-- alt binds
-- keymap("n", "<m-s>", "<cmd>split<cr>", opts)
keymap("n", "<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)
-- keymap("n", "<m-q>", "<cmd>:q<cr>", opts)

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

-- vim.api.nvim_set_keymap("n", "<m-e>", "NvimTreeToggle<cr>", opts)
-- vim.api.nvim_set_keymap(
--   "n",
--   "<m-f>",
--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   opts
-- )
-- Comment
keymap("n", "<m-/>",
       "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<m-/>",
       '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>',
       opts)

-- vim.api.nvim_set_keymap(
--   "n",
--   "<tab>",
--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   opts
-- )

vim.api.nvim_set_keymap("n", "<s-tab>",
                        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
                        opts)
vim.api.nvim_set_keymap("n", "<m-g>", "<cmd>Telescope git_branches<cr>", opts)
vim.api.nvim_set_keymap("n", "<s-enter>", "<cmd>TodoQuickFix<cr>", opts)

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)
keymap("n", "<c-l>", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)

return M
