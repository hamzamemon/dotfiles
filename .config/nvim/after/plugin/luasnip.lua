local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then return end

local types = require('luasnip.util.types')
local ft_functions = require('luasnip.extras.filetype_functions')

luasnip.setup({
    history = true,
    -- Update more often, :h events for more info.
    update_events = 'TextChanged,TextChangedI',
    -- see :h User, event should never be triggered(except if it is `doautocmd`'d)
    region_check_events = 'User None',
    -- Snippets aren't automatically removed if their text is deleted.
    -- `delete_check_events` determines on which events (:h events) a check for
    -- deleted snippets is performed.
    -- This can be especially useful when `history` is enabled.
    delete_check_events = 'TextChanged',
    -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
    -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
    store_selection_keys = '<Tab>',
    enable_autosnippets = true,
    ext_opts = {
        [types.textNode] = {
            active = {hl_group = 'LuasnipTextNodeActive'},
            passive = {hl_group = 'LuasnipTextNodePassive'},
            snippet_passive = {hl_group = 'LuasnipTextNodeSnippetPassive'}
        },
        [types.insertNode] = {
            active = {hl_group = 'LuasnipInsertNodeActive'},
            passive = {hl_group = 'LuasnipInsertNodePassive'},
            snippet_passive = {hl_group = 'LuasnipInsertNodeSnippetPassive'}
        },
        [types.exitNode] = {
            active = {hl_group = 'LuasnipExitNodeActive'},
            passive = {hl_group = 'LuasnipExitNodePassive'},
            snippet_passive = {hl_group = 'LuasnipExitNodeSnippetPassive'}
        },
        [types.functionNode] = {
            active = {hl_group = 'LuasnipFunctionNodeActive'},
            passive = {hl_group = 'LuasnipFunctionNodePassive'},
            snippet_passive = {hl_group = 'LuasnipFunctionNodeSnippetPassive'}
        },
        [types.snippetNode] = {
            active = {hl_group = 'LuasnipSnippetNodeActive'},
            passive = {hl_group = 'LuasnipSnippetNodePassive'},
            snippet_passive = {hl_group = 'LuasnipSnippetNodeSnippetPassive'}
        },
        [types.choiceNode] = {
            active = {hl_group = 'LuasnipChoiceNodeActive'},
            passive = {hl_group = 'LuasnipChoiceNodePassive'},
            snippet_passive = {hl_group = 'LuasnipChoiceNodeSnippetPassive'}
        },
        [types.dynamicNode] = {
            active = {hl_group = 'LuasnipDynamicNodeActive'},
            passive = {hl_group = 'LuasnipDynamicNodePassive'},
            snippet_passive = {hl_group = 'LuasnipDynamicNodeSnippetPassive'}
        },
        [types.snippet] = {
            active = {hl_group = 'LuasnipSnippetActive'},
            passive = {hl_group = 'LuasnipSnippetPassive'},
            -- not used!
            snippet_passive = {hl_group = 'LuasnipSnippetSnippetPassive'}
        },
        [types.restoreNode] = {
            active = {hl_group = 'LuasnipRestoreNodeActive'},
            passive = {hl_group = 'LuasnipRestoreNodePassive'},
            snippet_passive = {hl_group = 'LuasnipRestoreNodeSnippetPassive'}
        }
    },
    -- default applied in util.parser, requires iNode, cNode
    -- (Dependency cycle if here).
    parser_nested_assembler = nil,
    -- luasnip uses this function to get the currently active filetype. This
    -- is the (rather uninteresting) default, but it's possible to use
    -- eg. treesitter for getting the current filetype by setting ft_func to
    -- require('luasnip.extras.filetype_functions').from_cursor (requires
    -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
    -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
    ft_func = ft_functions.from_filetype,
    -- fn(bufnr) -> string[] (filetypes).
    load_ft_func = ft_functions.from_filetype_load,
    -- globals injected into luasnippet-files.
    snip_env = {
        s = require('luasnip.nodes.snippet').S,
        sn = require('luasnip.nodes.snippet').SN,
        t = require('luasnip.nodes.textNode').T,
        f = require('luasnip.nodes.functionNode').F,
        i = require('luasnip.nodes.insertNode').I,
        c = require('luasnip.nodes.choiceNode').C,
        d = require('luasnip.nodes.dynamicNode').D,
        r = require('luasnip.nodes.restoreNode').R,
        l = require('luasnip.extras').lambda,
        rep = require('luasnip.extras').rep,
        p = require('luasnip.extras').partial,
        m = require('luasnip.extras').match,
        n = require('luasnip.extras').nonempty,
        dl = require('luasnip.extras').dynamic_lambda,
        fmt = require('luasnip.extras.fmt').fmt,
        fmta = require('luasnip.extras.fmt').fmta,
        conds = require('luasnip.extras.expand_conditions'),
        types = require('luasnip.util.types'),
        events = require('luasnip.util.events'),
        parse = require('luasnip.util.parser').parse_snippet,
        ai = require('luasnip.nodes.absolute_indexer')
    },

    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 200,
    ext_prio_increase = 1
})

require('luasnip/loaders/from_vscode').lazy_load()
