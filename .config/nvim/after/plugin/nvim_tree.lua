local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then return end

local tree_cb = nvim_tree_config.nvim_tree_callback

local icons = require 'hamzamemon.icons'

nvim_tree.setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false, -- Completely disable netrw
    hijack_cursor = false,
    hijack_netrw = true, -- Hijack netrw windows (overridden if |disable_netrw| is `true`)
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    ignore_buf_on_tab_change = {},
    sort_by = 'name',
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    on_attach = 'disable', -- function(bufnr). If nil, will use the deprecated mapping strategy
    remove_keymaps = false,
    view = {
        adaptive_size = false,
        centralize_selection = false,
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
        -- @deprecated
        mappings = {
            custom_only = false,
            list = {
                {key = {'<CR>', 'o', '<2-LeftMouse>'}, action = 'edit'},
                {key = '<C-e>', action = 'edit_in_place'},
                {key = 'O', action = 'edit_no_picker'},
                {key = {'<C-]>', '<2-RightMouse>'}, action = 'cd'},
                {key = '<C-v>', action = 'vsplit'},
                {key = '<C-x>', action = 'split'},
                {key = '<C-t>', action = 'tabnew'},
                {key = '<', action = 'prev_sibling'},
                {key = '>', action = 'next_sibling'},
                {key = 'P', action = 'parent_node'},
                {key = '<BS>', action = 'close_node'},
                {key = '<Tab>', action = 'preview'},
                {key = 'K', action = 'first_sibling'},
                {key = 'J', action = 'last_sibling'},
                {key = 'I', action = 'toggle_git_ignored'},
                {key = 'H', action = 'toggle_dotfiles'},
                {key = 'U', action = 'toggle_custom'},
                {key = 'R', action = 'refresh'}, {key = 'a', action = 'create'},
                {key = 'd', action = 'remove'}, {key = 'D', action = 'trash'},
                {key = 'r', action = 'rename'},
                {key = '<C-r>', action = 'full_rename'},
                {key = 'x', action = 'cut'}, {key = 'c', action = 'copy'},
                {key = 'p', action = 'paste'},
                {key = 'y', action = 'copy_name'},
                {key = 'Y', action = 'copy_path'},
                {key = 'gy', action = 'copy_absolute_path'},
                {key = '[e', action = 'prev_diag_item'},
                {key = '[c', action = 'prev_git_item'},
                {key = ']e', action = 'next_diag_item'},
                {key = ']c', action = 'next_git_item'},
                {key = '-', action = 'dir_up'},
                {key = 's', action = 'system_open'},
                {key = 'f', action = 'live_filter'},
                {key = 'F', action = 'clear_live_filter'},
                {key = 'q', action = 'close'},
                {key = 'W', action = 'collapse_all'},
                {key = 'E', action = 'expand_all'},
                {key = 'S', action = 'search_node'},
                {key = '.', action = 'run_file_command'},
                {key = '<C-k>', action = 'toggle_file_info'},
                {key = 'g?', action = 'toggle_help'},
                {key = 'm', action = 'toggle_mark'},
                {key = 'bmv', action = 'bulk_move'}
            }
        },
        float = {
            enable = false,
            open_win_config = {
                relative = 'editor',
                border = 'rounded',
                width = 30,
                height = 30,
                row = 1,
                col = 1
            }
        }
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = 'none',
        root_folder_modifier = ':t',
        indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {corner = '└', edge = '│', item = '│', none = ' '}
        },
        icons = {
            webdev_colors = true,
            git_placement = 'before',
            padding = ' ',
            symlink_arrow = ' ➛ ',
            show = {file = true, folder = true, folder_arrow = true, git = true},
            glyphs = {
                default = '',
                symlink = '',
                folder = {
                    arrow_open = icons.ui.ArrowOpen,
                    arrow_closed = icons.ui.ArrowClosed,
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = ''
                },
                git = {
                    unstaged = '✗',
                    staged = '✓',
                    unmerged = '',
                    renamed = '➜',
                    untracked = '★',
                    deleted = '',
                    ignored = '◌'
                }
            }
        },
        special_files = {'Cargo.toml', 'Makefile', 'README.md', 'readme.md'},
        symlink_destination = true
    },
    hijack_directories = {enable = false, auto_open = true},
    update_focused_file = {enable = true, update_root = true, ignore_list = {}},
    ignore_ft_on_setup = {},
    system_open = {cmd = '', args = {}},
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
            warning = icons.diagnostics.Warning,
            error = icons.diagnostics.Error
        }
    },
    filters = {dotfiles = false, custom = {'.git'}, exclude = {'.gitignore'}},
    filesystem_watchers = {enable = true, debounce_delay = 50},
    git = {enable = true, ignore = true, show_on_dirs = true, timeout = 500},
    actions = {
        use_system_clipboard = true,
        change_dir = {enable = true, global = false, restrict_above_cwd = false},
        expand_all = {max_folder_discovery = 300, exclude = {}},
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = 'cursor',
                border = 'shadow',
                style = 'minimal'
            }
        },

        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                exclude = {
                    filetype = {
                        'notify', 'packer', 'qf', 'diff', 'fugitive',
                        'fugitiveblame'
                    },
                    buftype = {'nofile', 'terminal', 'help'}
                }
            }
        },
        remove_file = {close_window = true}
    },
    trash = {cmd = 'gio trash', require_confirm = true},
    live_filter = {prefix = '[FILTER]: ', always_show_folders = true},
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false
        }
    }
}

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>',
                        {noremap = true})
