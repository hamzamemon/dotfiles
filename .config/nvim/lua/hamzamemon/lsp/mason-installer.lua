local status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not status_ok then return end

mason_tool_installer.setup {

    -- a list of all tools you want to ensure are installed upon
    -- start; they should be the names Mason uses for each tool
    ensure_installed = {
        'actionlint', 'angular-language-server', 'bash-language-server',
        'black', 'codespell', 'cssmodules-language-server',
        'dockerfile-language-server', 'editorconfig-checker', 'eslint_d',
        'fixjson', 'flake8', 'hadolint', 'html-lsp', 'kotlin-language-server',
        'ktlint', 'lua-language-server', 'luacheck', 'markdownlint',
        'prettierd', 'shellcheck', 'shellharden', 'shfmt', 'stylelint-lsp',
        'stylua', 'texlab', 'typescript-language-server', 'vim-language-server',
        'vint', 'yaml-language-server'
    },

    -- if set to true this will check each tool for updates. If updates
    -- are available the tool will be updated. This setting does not
    -- affect :MasonToolsUpdate or :MasonToolsInstall.
    -- Default: false
    auto_update = true,

    -- automatically install / update on startup. If set to false nothing
    -- will happen on startup. You can use :MasonToolsInstall or
    -- :MasonToolsUpdate to install tools and check for updates.
    -- Default: true
    run_on_start = true,

    -- set a delay (in ms) before the installation starts. This is only
    -- effective if run_on_start is set to true.
    -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
    -- Default: 0
    start_delay = 3000 -- 3 second delay
}
