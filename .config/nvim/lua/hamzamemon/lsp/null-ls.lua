local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- completion sources
local completion = null_ls.builtins.completion

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

null_ls.setup {
    debug = false,
    sources = {
        code_actions.eslint_d, code_actions.gitsigns,
        code_actions.shellcheck.with {filetypes = {"sh", "zsh"}},
        completion.luasnip, completion.spell, completion.tags,
        diagnostics.actionlint, diagnostics.chktex, diagnostics.codespell,
        diagnostics.editorconfig_checker, diagnostics.eslint_d,
        diagnostics.flake8, diagnostics.hadolint, diagnostics.jsonlint,
        diagnostics.ktlint, diagnostics.luacheck, diagnostics.markdownlint,
        diagnostics.shellcheck.with {filetypes = {"sh", "zsh"}},
        diagnostics.stylelint, diagnostics.tidy, diagnostics.vint,
        diagnostics.yamllint, diagnostics.zsh, formatting.beautysh,
        formatting.black, formatting.codespell, formatting.eslint_d,
        formatting.fixjson, formatting.google_java_format, formatting.ktlint,
        formatting.latexindent, formatting.prettierd.with {
            extra_args = {"--single-quote", "--jsx-single-quote"}
        }, formatting.shellharden.with {filetypes = {"sh", "zsh"}},
        formatting.shfmt.with {filetypes = {"sh", "zsh"}}, formatting.stylua,
        formatting.tidy
    }
}
