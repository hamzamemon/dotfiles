-- mapping of user defined captures to highlight groups
local custom_captures = {
  -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
  ['foo.bar'] = 'Identifier',
  ['function.call'] = 'LuaFunctionCall',
  ['function.bracket'] = 'Type',
}

require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    use_languagetree = false,
    custom_captures = custom_captures,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },
  incremental_selection = {
    enable = true,
    keymaps = { -- mappings for incremental selection (visual mappings)
      init_selection = '<M-w>',    -- maps in normal mode to init the node/scope selection
      node_incremental = '<M-w>',  -- increment to the upper named parent
      scope_incremental = '<M-e>', -- increment to the upper scope (as defined in locals.scm)
      node_decremental = '<M-C-w>',  -- decrement to the previous node
    },
  },
  indent = {
    enable = true
  },
  refactor = {
    highlight_definitions = {
        enable = true
    },
    highlight_current_scope = {
        enable = true
    },
    smart_rename = {
      enable = true,
      keymaps = {
        -- mapping to rename reference under cursor
        smart_rename = 'grr',
      },
    },
    -- TODO: This seems broken...
      enable = true,
    navigation = {
      keymaps = {
        goto_definition = 'gnd', -- mapping to go to definition of symbol under cursor
        list_definitions = 'gnD', -- mapping to list all definitions in current file
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
  query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = {"BufWrite", "CursorHold"},
  },
  -- textobjects = { -- syntax-aware textobjects
  --   enable = true,
  --   disable = {},
  --   keymaps = {
  --     ['iL'] = { -- you can define your own textobjects directly here
  --       python = '(function_definition) @function',
  --       cpp = '(function_definition) @function',
  --       c = '(function_definition) @function',
  --       java = '(method_declaration) @function',
  --     },
  --     -- or you use the queries from supported languages with textobjects.scm
  --     ['af'] = '@function.outer',
  --     ['if'] = '@function.inner',
  --     ['aC'] = '@class.outer',
  --     ['iC'] = '@class.inner',
  --     ['ac'] = '@conditional.outer',
  --     ['ic'] = '@conditional.inner',
  --     ['ae'] = '@block.outer',
  --     ['ie'] = '@block.inner',
  --     ['al'] = '@loop.outer',
  --     ['il'] = '@loop.inner',
  --     ['is'] = '@statement.inner',
  --     ['as'] = '@statement.outer',
  --     ['ad'] = '@comment.outer',
  --     ['am'] = '@call.outer',
  --     ['im'] = '@call.inner',
  --   },
  -- },
  -- ensure_installed = {'lua'}, -- one of 'all', 'language', or a list of languages
}

vim.cmd [[highlight IncludedC guibg=#373b41]]

--[[

-- From python, get all the things we import, update __all__

(import_from_statement name: (*) @Importer)

(
 (assignment left: (expression_list (identifier)) @assign)
 (#eq? @assign "__all__")
)

--]]

-- require'nvim-treesitter.configs'.setup {
--   refactor = {
--     highlight_current_scope = { enable = false },
--   },
-- }

-- require'nvim-treesitter.configs'.setup {
--   refactor = {
--     smart_rename = {
--       enable = true,
--       keymaps = {
--         smart_rename = "grr",
--       },
--     },
--   },
-- }
