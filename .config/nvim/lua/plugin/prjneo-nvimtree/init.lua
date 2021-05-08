-- Where the window will open
vim.g.nvim_tree_side = 'right'

-- Window width
vim.g.nvim_tree_width = 40

-- Do not load these
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}

-- Close the tree if it's the last window
vim.g.nvim_tree_auto_close = 1

-- Update the cursor to update to the current location in the tree
vim.g.nvim_tree_follow = 1

-- Display indent markers when folders are open
vim.g.nvim_tree_indent_markers = 1

-- Enable file highlight for git attributes
vim.g.nvim_tree_git_hl = 1

-- Open the tree when entering a new tab if the tree was previously open
vim.g.nvim_tree_tab_open = 1

-- Do not resize the tree to its original width when opening a new file
vim.g.nvim_tree_width_allow_resize = 1

-- Add a trailing slash to folder names
vim.g.nvim_tree_add_trailing = 1

-- Group folders together that contain only one folder
vim.g.nvim_tree_group_empty = 1

-- Show LSP diagnostics in the sign column
vim.g.nvim_tree_lsp_diagnostics = 1

-- Highlight these files with `NvimTreeSpecialFile`
vim.g.nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}

-- Tree icons
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}

-- Tree mappings
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    ["<CR>"] = tree_cb("edit"),
    ["o"] = tree_cb("edit"),
    ["l"] = tree_cb("edit"),
    ["<2-LeftMouse>"] = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"] = tree_cb("cd"),
    ["<C-v>"] = tree_cb("vsplit"),
    ["<C-x>"] = tree_cb("split"),
    ["<C-t>"] = tree_cb("tabnew"),
    ["<"] = tree_cb("prev_sibling"),
    [">"] = tree_cb("next_sibling"),
    ["<BS>"] = tree_cb("close_node"),
    ["h"] = tree_cb("close_node"),
    ["<S-CR>"] = tree_cb("close_node"),
    ["<Tab>"] = tree_cb("preview"),
    ["I"] = tree_cb("toggle_ignored"),
    ["H"] = tree_cb("toggle_dotfiles"),
    ["R"] = tree_cb("refresh"),
    ["a"] = tree_cb("create"),
    ["d"] = tree_cb("remove"),
    ["r"] = tree_cb("rename"),
    ["<C-r>"] = tree_cb("full_rename"),
    ["x"] = tree_cb("cut"),
    ["c"] = tree_cb("copy"),
    ["p"] = tree_cb("paste"),
    ["[c"] = tree_cb("prev_git_item"),
    ["]c"] = tree_cb("next_git_item"),
    ["-"] = tree_cb("dir_up"),
    ["q"] = tree_cb("close")
}

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>',
                        {noremap = true, silent = true})
