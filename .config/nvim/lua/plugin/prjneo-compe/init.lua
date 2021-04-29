require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        tags = true,
        spell = true,
        calc = true,
        emoji = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = true,
        -- ultisnips = true,
        snippets_nvim = true
        -- nvim_treesitter = true,
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.cmd('highlight link CompeDocumentation NormalFloat')

-- NOTE: Order is important. You can't lazy loading lexima.vim.
-- vim.g.lexima_no_default_rules = true
-- vim.cmd('call lexima#set_default_rules()')
vim.api.nvim_set_keymap('i', '<C-y>', 'compe#confirm("<C-y>")',
                        {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()',
                        {noremap = true, expr = true, silent = true})
--[[
vim.api.nvim_set_keymap('i', '<CR>',
'compe#confirm(lexima#expand(\'<LT>CR>\', \'i\'))',
{noremap = true, expr = true, silent = true})
]] --
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close(\'<C-e>\')',
                        {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-f>', ' compe#scroll({ \'delta\': +4 })',
                        {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({ \'delta\': -4 })',
                        {noremap = true, expr = true, silent = true})
