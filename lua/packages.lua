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
        'navarasu/onedark.nvim',
        'folke/tokyonight.nvim',
        'rebelot/kanagawa.nvim',
    }

    -- interface
    use {
        'glepnir/dashboard-nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        event = 'VimEnter',
        config = function()
            require('dashboard').setup(require('config.cfg_dashboard'))
        end,
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("nvim-tree").setup(require('config.nvimtree'))
        end,
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
        config = function()
            require('lualine').setup(require('config.cfg_lualine'))
        end,
    }
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('bufferline').setup(require('config.cfg_bufferline'))
        end,
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        config = function()
            require("indent_blankline").setup(require('config.indent'))

        end,
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    }

    -- code & git
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup(require('config.treesitter'))
        end,
    }
    use { 'liuchengxu/vista.vim', event = 'BufRead'}
    use { 'tpope/vim-fugitive' }

    -- code edition
    use { 'mg979/vim-visual-multi', event = 'BufRead' }
    use { 'andymass/vim-matchup', event = 'CursorMoved' }
    use {
        'terrortylor/nvim-comment',
        cmd = 'CommentToggle',
        config = function()
            require('nvim_comment').setup()
        end,
    }

    use {
        'williamboman/mason.nvim',
        run = ':MasonUpdate',
        config = function ()
            require('mason').setup(require('config.cfg_mason'))
        end
    }
    -- LSP powers
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
            'jose-elias-alvarez/null-ls.nvim',
        },
        config = function()
            require('plugins.lspconfig').setup()
            require('plugins.null-ls').setup()
        end,
    }
    -- DAP
    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            'mfussenegger/nvim-dap',
            'jay-babu/mason-nvim-dap.nvim',
        },
        config = function ()
            require('plugins.nvim-dap').setup()
        end,
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
        config = function()
            require('plugins.nvim-cmp').setup()
        end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
