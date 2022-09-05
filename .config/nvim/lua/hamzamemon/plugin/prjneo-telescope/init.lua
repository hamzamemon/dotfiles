local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end

local trouble_ok, trouble = pcall(require, 'trouble')
if not trouble_ok then return end

local actions = require('telescope.actions')
local action_layout = require "telescope.actions.layout"
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')

local icons = require "hamzamemon.icons"

telescope.setup {
    defaults = {
        sorting_strategy = "descending",
        selection_strategy = "reset",
        scroll_strategy = "cycle",
        layout_strategy = "horizontal",
        layout_config = {
            bottom_pane = {
                height = 25,
                preview_cutoff = 120,
                prompt_position = "top"
            },
            center = {
                height = 0.4,
                preview_cutoff = 40,
                prompt_position = "top",
                width = 0.5
            },
            cursor = {height = 0.9, preview_cutoff = 40, width = 0.8},
            horizontal = {
                height = 0.9,
                preview_cutoff = 120,
                prompt_position = "bottom",
                width = 0.8
            },
            vertical = {
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = "bottom",
                width = 0.8
            }
        },
        cycle_layout_list = {"horizontal", "vertical"},
        winblend = 0,
        wrap_results = false,
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = " ",
        entry_prefix = ' ',
        multi_icon = '+',
        initial_mode = 'insert',
        border = true,
        path_display = {"smart"},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        hl_result_eol = true,
        dynamic_preview_title = false,
        results_title = 'Results',
        prompt_title = 'Prompt',
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-c>"] = actions.close,
                ["<C-x>"] = false,

                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-b>"] = actions.results_scrolling_up,
                ["<C-f>"] = actions.results_scrolling_down,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<c-t>"] = trouble.open_with_trouble,

                ["<c-d>"] = actions.delete_buffer,

                -- ["<C-u>"] = actions.preview_scrolling_up,
                -- ["<C-d>"] = actions.preview_scrolling_down,

                -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<Tab>"] = actions.close,
                ["<S-Tab>"] = actions.close,
                -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist +
                    actions.open_qflist,
                ["<M-p>"] = action_layout.toggle_preview,
                ["<C-l>"] = actions.complete_tag,
                ["<C-h>"] = actions.which_key -- keys from pressing <C-h>
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<c-t>"] = trouble.open_with_trouble,
                ["<C-b>"] = actions.results_scrolling_up,
                ["<C-f>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.close,
                ["<S-Tab>"] = actions.close,
                -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist +
                    actions.open_qflist,
                ["<M-p>"] = action_layout.toggle_preview,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["q"] = actions.close,
                ["dd"] = require("telescope.actions").delete_buffer,
                ["s"] = actions.select_horizontal,
                ["v"] = actions.select_vertical,
                ["t"] = actions.select_tab,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key
            }
        },
        vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case", "--trim" -- add this value
        },
        color_devicons = true,
        file_sorter = sorters.get_fzf_sorter,
        generic_sorter = sorters.get_fzf_sorter,
        prefilter_sorter = sorters.prefilter,
        file_ignore_patterns = {
            ".git/", "target/", "docs/", "vendor/*", "%.lock", "__pycache__/*",
            "%.sqlite3", "%.ipynb", "node_modules/*", "%.jpg", "%.jpeg",
            "%.png", "%.svg", "%.otf", "%.ttf", "%.webp", ".dart_tool/",
            ".github/", ".gradle/", ".idea/", ".settings/", ".vscode/",
            "__pycache__/", "build/", "env/", "gradle/", "node_modules/",
            "%.pdb", "%.dll", "%.class", "%.exe", "%.cache", "%.ico", "%.pdf",
            "%.dylib", "%.jar", "%.docx", "%.met", "smalljre_*/*", ".vale/",
            "%.burp", "%.mp4", "%.mkv", "%.rar", "%.zip", "%.7z", "%.tar",
            "%.bz2", "%.epub", "%.flac", "%.tar.gz"
        },
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        buffer_previewer_maker = previewers.buffer_previewer_maker
    },
    pickers = {
        live_grep = {theme = "dropdown"},
        grep_string = {theme = "dropdown"},
        find_files = {
            theme = "dropdown",
            previewer = false,
            find_command = {"rg", "--files", "--hidden", "--glob", "!.git/*"}
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
            initial_mode = "normal"
        },
        planets = {show_pluto = true, show_moon = true},
        colorscheme = {
            -- enable_preview = true,
        },
        lsp_references = {theme = "dropdown", initial_mode = "normal"},
        lsp_definitions = {theme = "dropdown", initial_mode = "normal"},
        lsp_declarations = {theme = "dropdown", initial_mode = "normal"},
        lsp_implementations = {theme = "dropdown", initial_mode = "normal"}
    },
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "jpg", "jpeg", "mp4", "webp", "webm", "pdf"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        fzf_native = {
            override_generic_sorter = true,
            override_file_sorter = true
        },
        fzf_writer = {
            minimum_grep_characters = 2,
            minimum_files_characters = 2,

            -- Disabled by default.
            -- Will probably slow down some aspects of the sorter, but can make color highlights.
            -- I will work on this more later.
            use_highlighter = true
        },
        hop = {
            -- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
            keys = {
                "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "q", "w", "e",
                "r", "t", "y", "u", "i", "o", "p", "A", "S", "D", "F", "G", "H",
                "J", "K", "L", ":", "Q", "W", "E", "R", "T", "Y", "U", "I", "O",
                "P"
            },
            -- Highlight groups to link to signs and lines; the below configuration refers to demo
            -- sign_hl typically only defines foreground to possibly be combined with line_hl
            sign_hl = {"WarningMsg", "Title"},
            -- optional, typically a table of two highlight groups that are alternated between
            line_hl = {"CursorLine", "Normal"},
            -- options specific to `hop_loop`
            -- true temporarily disables Telescope selection highlighting
            clear_selection_hl = false,
            -- highlight hopped to entry with telescope selection highlight
            -- note: mutually exclusive with `clear_selection_hl`
            trace_entry = true,
            -- jump to entry where hoop loop was started from
            reset_selection = true
        },
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                }
            }
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        }
    }
}

-- Load extensions
telescope.load_extension "fzy_native"
telescope.load_extension "fzf_writer"
telescope.load_extension 'fzf'
telescope.load_extension "gh"
telescope.load_extension 'media_files'
telescope.load_extension "cheat"
telescope.load_extension "dap"
telescope.load_extension 'hop'
telescope.load_extension 'luasnip'
telescope.load_extension "file_browser"
telescope.load_extension "ui-select"

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fd', ':Telescope buffers<CR>',
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
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser",
                        {noremap = true})
