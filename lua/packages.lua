local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end


return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use { 'tpope/vim-fugitive' }

    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup() end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('lualine').setup() end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvimtree').setup() end
    }

    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.bufferline').setup() end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        config = function() require('plugins.indent').setup() end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }

    use { 'rebelot/kanagawa.nvim' }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins.treesitter').setup() end
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
        },
        config = function() require('plugins.lspconfig').setup() end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim',
        },
        config = function() require('plugins.nvim-cmp').setup() end
    }

    use {
        'terrortylor/nvim-comment',
        cmd = 'CommentToggle',
        config = function() require('nvim_comment').setup() end
    }

    use { 'andymass/vim-matchup', event = 'CursorMoved' }

    use { 'mg979/vim-visual-multi', event = 'BufRead' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
