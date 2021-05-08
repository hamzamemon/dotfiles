local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " ..
                install_path)
    execute "packadd packer.nvim"
end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Auto execute lua files in lua/plugin/, ftplugin/ and after/ftplugin/
    use 'tjdevries/astronauta.nvim'

    -- Color
    use {'dracula/vim', as = 'dracula'}
    use 'norcalli/nvim-colorizer.lua'

    -- Status Line and Bufferline
    use 'glepnir/galaxyline.nvim'
    use 'romgrk/barbar.nvim'
    use 'moll/vim-bbye'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
    use 'yamatsum/nvim-nonicons'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'nvim-lua/completion-nvim'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'kabouzeid/nvim-lspinstall'
    use 'liuchengxu/vista.vim'
    use 'wbthomason/lsp-status.nvim'
    use {
        'folke/lsp-trouble.nvim',
        config = function()
            require('trouble').setup {auto_preview = false, auto_fold = true}
        end
    }

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/completion-treesitter'
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-angular'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-fzf-writer.nvim'
    use 'nvim-telescope/telescope-github.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-cheat.nvim'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'tami5/sql.nvim'

    -- Development
    use 'turbio/bracey.vim'
    use 'elzr/vim-json'
    use {'prettier/vim-prettier', run = 'yarn install'}
    use 'mattn/emmet-vim'

    -- FZF
    use {'junegunn/fzf', run = './install --all'}
    use {'junegunn/fzf.vim'}
    use {
        'yuki-yano/fzf-preview.vim',
        branch = 'release/remote',
        run = ':UpdateRemotePlugins'
    }

    -- Snippets
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Git
    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}
    use {'pwntester/octo.nvim', config = function() require"octo".setup() end}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'rhysd/committia.vim'
    use 'rhysd/git-messenger.vim'

    -- Registers/Quickfix
    use 'gennaro-tedesco/nvim-peekup'
    use 'romainl/vim-qf'
    use 'kevinhwang91/nvim-bqf'

    -- Text manipulation
    use 'godlygeek/tabular'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'AndrewRadev/splitjoin.vim'
    use 'tpope/vim-surround'

    -- LaTeX/Markdown
    use 'lervag/vimtex'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

    -- Applications
    use 'vimwiki/vimwiki'
    use 'vuciv/vim-bujo'
    use 'dbeniamine/cheat.sh-vim'

    -- Miscellaneous
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use 'sjl/gundo.vim'
    use 'andymass/vim-matchup'
    use 'cohama/lexima.vim'
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
end)
