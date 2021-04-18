-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Auto execute lua files in lua/plugin/, ftplugin/ and after/ftplugin/
    use 'tjdevries/astronauta.nvim'

    -- Status Line and Bufferline
    use 'glepnir/galaxyline.nvim'
    use 'romgrk/barbar.nvim'
    use 'moll/vim-bbye'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
end)
