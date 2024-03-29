return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- themes
    use 'shaunsingh/nord.nvim'
    use {'dracula/vim', as = 'dracula'}
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
    use("ThePrimeagen/harpoon")
    use("windwp/nvim-autopairs")
    use("mattn/emmet-vim")
    use('numToStr/Comment.nvim')

    use("elixir-editors/vim-elixir")

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
end)

