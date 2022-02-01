local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('bufferline').setup() end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('lualine').setup() end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup() end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        cmd = { 'NvimTreeToggle', 'NvimTreeFocus', 'NvimTreeRefresh' },
        config = function() require('plugins.nvimtree').setup() end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        config = function() require('plugins.indent').setup() end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        }
    }

    use {
        'rebelot/kanagawa.nvim',
        config = function() require('kanagawa.colors').setup() end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        run = ':TSUpdate',
        config = function() require('plugins.treesitter').setup() end
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/nvim-lsp-installer',
            'hrsh7th/cmp-nvim-lsp'
        },
        config = function() require('plugins.lspconfig').setup() end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path'
        },
        config = function() require('plugins.cmp').setup() end
    }

    use {
        'onsails/lspkind-nvim',
        config = function() require('plugins.lspkind').setup() end
    }

    use { 'andymass/vim-matchup', event = 'CursorMoved'}

    use { 'sbdchd/neoformat' , cmd = 'Neoformat'}

    use { 'mg979/vim-visual-multi' }

    use {
        'terrortylor/nvim-comment',
        cmd = 'CommentToggle',
        config = function() require('nvim_comment').setup() end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

