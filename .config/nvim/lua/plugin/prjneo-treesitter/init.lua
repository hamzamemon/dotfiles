-- mapping of user defined captures to highlight groups
local custom_captures = {
    -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
    ['foo.bar'] = 'Identifier',
    ['function.call'] = 'LuaFunctionCall',
    ['function.bracket'] = 'Type',

    ['namespace.type'] = 'TSNamespaceType'
}

require('nvim-treesitter.configs').setup {
    -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        'bash', 'bibtex', 'comment', 'css', 'graphql', 'html', 'java',
        'javascript', 'jsdoc', 'json', 'jsonc', 'kotlin', 'latex', 'lua', 'php',
        'python', 'query', 'regex', 'scss', 'typescript', 'vue', 'yaml'
    },
    ignore_install = {},
    highlight = {
        enable = true, -- false will disable the whole extension
        use_languagetree = false,
        custom_captures = custom_captures
    },
    incremental_selection = {
        enable = true,
        keymaps = { -- mappings for incremental selection (visual mappings)
            init_selection = '<M-w>', -- maps in normal mode to init the node/scope selection
            node_incremental = '<M-w>', -- increment to the upper named parent
            scope_incremental = '<M-e>', -- increment to the upper scope (as defined in locals.scm)
            node_decremental = '<M-C-w>' -- decrement to the previous node
        }
    },
    indent = {enable = true},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?'
        }
    },
    refactor = {
        highlight_definitions = {enable = true},
        highlight_current_scope = {enable = false},
        smart_rename = {
            enable = true,
            keymaps = {
                -- mapping to rename reference under cursor
                smart_rename = 'grr'
            }
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = 'gnd',
                list_definitions = 'gnD',
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>"
            }
        }
    },
    autotag = {enable = true},
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters
        max_file_lines = 2000 -- Disable for files with more than 1000 lines
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite", "CursorHold"}
    },
    context_commentstring = {enable = true},
    matchup = {enable = true}
}
