if not pcall(require, 'telescope') then return end

local actions = require('telescope.actions')
local sorters = require('telescope.sorters')

require('telescope').setup {
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",

        winblend = 0,
        preview_cutoff = 120,

        layout_strategy = "horizontal",
        layout_defaults = {
            horizontal = {
                width_padding = 0.1,
                height_padding = 0.1,
                preview_width = 0.6
                -- mirror = false
            },
            vertical = {
                width_padding = 0.05,
                height_padding = 1,
                preview_height = 0.5
                -- mirror = false
            }
        },

        selection_strategy = "reset",
        prompt_position = "top",
        sorting_strategy = "descending",
        scroll_strategy = "cycle",
        color_devicons = true,

        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<esc>"] = actions.close,

                ["<C-x>"] = false,

                ["<C-s>"] = actions.select_horizontal
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-x>"] = false,
                ["<C-s>"] = actions.select_horizontal
            }
        },

        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},

        file_sorter = sorters.get_fuzzy_file,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        vimgrep_arguments = {
            'rg', '--no-heading', '--with-filename', '--line-number',
            '--column', '--smart-case'
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        },
        fzf_writer = {
            minimum_grep_characters = 2,
            minimum_files_characters = 2,
            use_highlighter = false
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

-- Load extensions
pcall(require('telescope').load_extension, "fzy_native")
pcall(require('telescope').load_extension, "fzf_writer")
pcall(require('telescope').load_extension, "fzf")
pcall(require('telescope').load_extension, "gh")
require('telescope').load_extension('media_files')
pcall(require('telescope').load_extension, "cheat")
pcall(require('telescope').load_extension, "dap")
require('telescope').load_extension('octo')

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ft', ':Telescope treesitter<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope symbols<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fm', ':Telescope media_files<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope cheat fd<CR>',
                        {noremap = true})

-- Selection highlight groups
vim.cmd('highlight TelescopeSelection      guifg=#d79921 gui=bold') -- selected item
vim.cmd('highlight TelescopeSelectionCaret guifg=#cc241d') -- selection caret
vim.cmd('highlight TelescopeMultiSelection guifg=#928374') -- multisections
vim.cmd('highlight TelescopeNormal         guibg=#00000') -- floating windows created by telescope.

-- Border highlight groups.
vim.cmd('highlight TelescopeBorder         guifg=#ffffff')
vim.cmd('highlight TelescopePromptBorder   guifg=#ffffff')
vim.cmd('highlight TelescopeResultsBorder  guifg=#ffffff')
vim.cmd('highlight TelescopePreviewBorder  guifg=#ffffff')

-- Used for highlighting characters that you match.
-- vim.cmd('highlight TelescopeMatching       guifg=blue')

-- Used for the prompt prefix
vim.cmd('highlight TelescopePromptPrefix   guifg=red')
