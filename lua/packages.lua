local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end


return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }

    -- themes
    use {
        'rebelot/kanagawa.nvim',
        'navarasu/onedark.nvim',
        'projekt0n/github-nvim-theme',
    }

    -- interface
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function() require('plugins.dashboard').setup() end,
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvimtree').setup() end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.lualine').setup() end
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.bufferline').setup() end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        config = function() require('plugins.indent').setup() end
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup() end
    }

    -- code & git
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins.treesitter').setup() end
    }
    use { 'liuchengxu/vista.vim', event = 'BufRead'}
    use { 'tpope/vim-fugitive' }

    -- code edition
    use { 'mg979/vim-visual-multi', event = 'BufRead' }
    use { 'andymass/vim-matchup', event = 'CursorMoved' }
    use {
        'terrortylor/nvim-comment',
        cmd = 'CommentToggle',
        config = function() require('nvim_comment').setup() end
    }

    -- LSP powers
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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
