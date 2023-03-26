return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- themes
    use {'ellisonleao/gruvbox.nvim'}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use('nvim-lua/plenary.nvim')
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x'
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    use('TimUntersberger/neogit')
    use("folke/zen-mode.nvim")
    use("windwp/nvim-autopairs")
    use('numToStr/Comment.nvim')
end)

