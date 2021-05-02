local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then return end

local _, lspconfig_util = pcall(require, 'lspconfig.util')
local nvim_status = require('lsp-status')

local nnoremap = vim.keymap.nnoremap

require('vim.lsp.log').set_level("debug")
-- require('vim.lsp.log').set_level("trace")

require('lsp.status').activate()
require('lsp.handlers')

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>",
                                {noremap = true, silent = true})
end

local nvim_exec = function(txt) vim.api.nvim_exec(txt, false) end

local custom_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client)
    local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

    nvim_status.on_attach(client)

    nnoremap {"<space>dn", vim.lsp.diagnostic.goto_next, buffer = 0}
    nnoremap {"<space>dp", vim.lsp.diagnostic.goto_prev, buffer = 0}
    nnoremap {"<space>sl", vim.lsp.diagnostic.show_line_diagnostics, buffer = 0}

    nnoremap {"gd", vim.lsp.buf.definition, buffer = 0}
    nnoremap {"gD", vim.lsp.buf.declaration, buffer = 0}

    nnoremap {"<space>cr", MyLspRename, buffer = 0}

    telescope_mapper('gr', 'lsp_references', {
        layout_strategy = "vertical",
        sorting_strategy = "ascending",
        prompt_position = "top",
        ignore_filename = true
    }, true)

    -- TODO: I don't like these combos
    telescope_mapper('<space>wd', 'lsp_document_symbols',
                     {ignore_filename = true}, true)
    telescope_mapper('<space>ww', 'lsp_workspace_symbols',
                     {ignore_filename = true}, true)
    if filetype == 'rust' then
        telescope_mapper('<space>wf', 'lsp_workspace_symbols',
                         {ignore_filename = true, query = '#'}, true)
    end

    telescope_mapper('<space>ca', 'lsp_code_actions', nil, true)

    -- mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    -- mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    -- mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')

    if filetype ~= 'lua' then mapper('n', 'K', 'vim.lsp.buf.hover()') end

    mapper('i', '<c-s>', 'vim.lsp.buf.signature_help()')
    mapper('n', '<space>rr',
           'vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd [[e]]')

    -- Rust is currently the only thing w/ inlay hints
    if filetype == 'rust' then
        vim.cmd(
            [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { ]] ..
                [[aligned = true, prefix = " » " ]] .. [[} ]])
    end

    if vim.tbl_contains({"go", "rust"}, filetype) then
        vim.cmd [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]]
    end

    vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        nvim_exec [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]]
    end
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.codeLens = {dynamicRegistration = false}
updated_capabilities = vim.tbl_deep_extend('keep', updated_capabilities,
                                           nvim_status.capabilities)
updated_capabilities.textDocument.completion.completionItem.snippetSupport =
    true
updated_capabilities.textDocument.completion.completionItem.resolveSupport =
    {properties = {'documentation', 'detail', 'additionalTextEdits'}}

lspconfig.bashls.setup {
    cmd = {
        DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server",
        "start"
    },
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    filetypes = {"sh", "zsh"}
}

lspconfig.clangd.setup({
    cmd = {
        "clangd", "--background-index", "--suggest-missing-includes",
        "--clang-tidy", "--header-insertion=iwyu"
    },
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,

    -- Required for lsp-status
    init_options = {clangdFileStatus = true},
    handlers = nvim_status.extensions.clangd.setup()
})

if 1 == vim.fn.executable('cmake-language-server') then
    lspconfig.cmake.setup {
        on_init = custom_init,
        on_attach = custom_attach,
        capabilities = updated_capabilities
    }
end

lspconfig.cssls.setup {
    cmd = {
        "node", DATA_PATH ..
            "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
        "--stdio"
    },
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
}

lspconfig.dockerls.setup {
    cmd = {
        DATA_PATH ..
            "/lspinstall/dockerfile/node_modules/.bin/docker-langserver",
        "--stdio"
    },
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    root_dir = vim.loop.cwd
}

lspconfig.emmet_ls = {
    default_config = {
        cmd = {'emmet-ls', '--stdio'},
        filetypes = {'html', 'css'},
        root_dir = function() return vim.loop.cwd() end,
        settings = {}
    }
}

lspconfig.gdscript.setup {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
}

lspconfig.gopls.setup {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    settings = {gopls = {codelenses = {test = true}}}
}

require'lspconfig'.html.setup {
    cmd = {
        "node", DATA_PATH ..
            "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
        "--stdio"
    },
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
}

require'lspconfig'.jsonls.setup {
    cmd = {
        "node", DATA_PATH ..
            "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
        "--stdio"
    },
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    }
}

local util = require 'lspconfig/util'

local bin_name = DATA_PATH ..
                     "/lspinstall/kotlin/language-server/server/build/install/server/bin/kotlin-language-server"
if vim.fn.has('win32') == 1 then bin_name = bin_name .. ".bat" end

local root_files = {
    'settings.gradle', -- Gradle (multi-project)
    'settings.gradle.kts', -- Gradle (multi-project)
    'build.xml', -- Ant
    'pom.xml' -- Maven
}

local fallback_root_files = {
    'build.gradle', -- Gradle
    'build.gradle.kts' -- Gradle
}

require'lspconfig'.kotlin_language_server.setup {
    cmd = {bin_name},
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    root_dir = function(fname)
        return util.root_pattern(unpack(root_files))(fname) or
                   util.root_pattern(unpack(fallback_root_files))(fname)
    end
}

-- Load lua configuration from nlua.
--[[

require('nlua.lsp.nvim').setup(lspconfig, {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,

    root_dir = function(fname)
        if string.find(vim.fn.fnamemodify(fname, ":p"), "nvim/") then
            return vim.fn.expand("~/.config/nvim/")
        end

        -- ~/git/config_manager/xdg_config/nvim/...
        return lspconfig_util.find_git_ancestor(fname) or
                   lspconfig_util.path.dirname(fname)
    end,

    globals = {
        -- Colorbuddy
        "Color", "c", "Group", "g", "s", -- Custom
        "RELOAD"
    }
})
]] --

require'lspconfig'.intelephense.setup {
    cmd = {
        DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense", "--stdio"
    },
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
}

lspconfig.pyls.setup {
    plugins = {pyls_mypy = {enabled = true, live_mode = false}},
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
}

lspconfig.rust_analyzer.setup({
    cmd = {"rust-analyzer"},
    filetypes = {"rust"},
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
})

require'lspconfig'.texlab.setup {
    cmd = {DATA_PATH .. "/lspinstall/latex/texlab"},
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
}

lspconfig.tsserver.setup({
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"
    },
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
})

lspconfig.vimls.setup {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
}

lspconfig.yamlls.setup {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities
}

vim.cmd [[autocmd CursorHold, CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]