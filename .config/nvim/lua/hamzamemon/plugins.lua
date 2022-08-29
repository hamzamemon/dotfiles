local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

packer.startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Color
    use 'hamzamemon/sunflower'
    use 'norcalli/nvim-colorizer.lua'

    -- Status Line
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'WhoIsSethDaniel/mason-tool-installer.nvim'
    use "jose-elias-alvarez/null-ls.nvim"
    use "ray-x/lsp_signature.nvim"
    use "RRethy/vim-illuminate"
    use "j-hui/fidget.nvim"
    use 'folke/lsp-trouble.nvim'
    use "b0o/SchemaStore.nvim"
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use 'kdheepak/cmp-latex-symbols'
    use "hrsh7th/cmp-emoji"
    use "hrsh7th/cmp-nvim-lua"

    -- Snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-angular'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "RRethy/nvim-treesitter-textsubjects"

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use 'nvim-telescope/telescope-fzf-writer.nvim'
    use 'nvim-telescope/telescope-github.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-cheat.nvim'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'nvim-telescope/telescope-hop.nvim'
    use 'benfowler/telescope-luasnip.nvim'
    use 'kkharji/sqlite.lua'
    use 'BurntSushi/ripgrep'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'f-person/git-blame.nvim'
    use 'pwntester/octo.nvim'

    -- Development
    use 'turbio/bracey.vim'
    use 'numToStr/Comment.nvim'
    use 'folke/todo-comments.nvim'
    use "mfussenegger/nvim-jdtls"

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use "rcarriga/nvim-dap-ui"
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'

    -- Text manipulation
    use 'godlygeek/tabular'
    use 'tpope/vim-repeat'
    use "kylechui/nvim-surround"
    use {
        "abecodes/tabout.nvim",
        wants = {"nvim-treesitter"} -- or require if not used so far
    }
    use 'wellle/targets.vim'
    use "monaqa/dial.nvim"

    -- Registers/Quickfix
    use 'romainl/vim-qf'
    use 'kevinhwang91/nvim-bqf'

    -- Miscellaneous
    use 'lukas-reineke/indent-blankline.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    })
    use 'sjl/gundo.vim'
    use 'andymass/vim-matchup'
    use 'cohama/lexima.vim'
    use 'dstein64/vim-startuptime'
    use 'vimwiki/vimwiki'
    use 'vuciv/vim-bujo'
    use "rcarriga/nvim-notify"
    use 'lewis6991/impatient.nvim'
    use "windwp/nvim-spectre"
    use "folke/which-key.nvim"
end)
