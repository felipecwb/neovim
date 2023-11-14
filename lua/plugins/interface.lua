local logo = [[
                     `. ___
                    __,' __`.                _..----....____
        __...--.'``;.   ,.   ;``--..__     .'    ,-._    _.-'
  _..-''-------'   `'   `'   `'     O ``-''._   (,;') _,'
,'________________                          \`-._`-','
 `._              ```````````------...___   '-.._'-:
    ```--.._      ,.                     ````--...__\-.
            `.--. `-`                       ____    |  |`
              `. `.                       ,'`````.  ;  ;`
                `._`.        __________   `.      \'__/`
                   `-:._____/______/___/____`.     \  `
                               |       `._    `.    \
                               `._________`-.   `.   `.___
                                             SSt  `------'`
]]

return {
    {
        'glepnir/dashboard-nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        event = 'VimEnter',
        config = function()
            require('dashboard').setup({
                theme = 'hyper',
                change_to_vcs_root = true,
                config = {
                    header = vim.split(logo, "\n"),
                    shortcut = {
                        { group = '@property', key = 'n', desc = " New File", action = 'enew' },
                        { group = '@property', key = 'f', desc = " Find Files", action = 'Telescope find_files' },
                        { group = '@property', key = 'l', desc = "󰒲 Lazy", action = "Lazy" },
                    },
                },
            })
        end,
    },
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require("nvim-tree").setup({
                hijack_netrw = true,
                disable_netrw = true,
                open_on_tab = true,
                update_cwd = false,
                system_open = {
                    cmd = "xdg-open",
                    args = {}
                },
                filters = {
                    dotfiles = false,
                    custom = {}
                },
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 500,
                },
                actions = {
                    open_file = { quit_on_open = false },
                    change_dir = { global = false },
                },
                update_focused_file = {
                    enable = false,
                    update_cwd = false,
                    ignore_list = {},
                },
                view = {
                    width = 45,
                    number = false,
                    side = 'left',
                    signcolumn = "yes",
                    relativenumber = false,
                },
                diagnostics = {
                    enable = true,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    }
                },
                on_attach = function(bufnr)
                    local api = require('nvim-tree.api')
                    -- default mappings
                    api.config.mappings.default_on_attach(bufnr)
                    -- force close when in buffer
                    vim.keymap.del('n', '<C-e>', { buffer = bufnr })
                    vim.keymap.set('n', '<C-e>', api.tree.close, {
                        buffer = bufnr, noremap = true, silent = true, nowait = true
                    })
                end,
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('lualine').setup({
                extensions = {
                    'fzf',
                    'fugitive',
                    'nvim-tree',
                    'nvim-dap-ui',
                },
            })
        end,
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('bufferline').setup({
                options = {
                    themeable = true,
                    separator_style = 'thin', -- 'slant'
                    indicator = { style = 'icon', icon = ' ' },
                    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
                    diagnostics = "nvim_lsp",
                    show_tab_indicators = true,
                    show_close_icon = true,
                    show_buffer_close_icons = true,
                    always_show_bufferline = true,
                    enforce_regular_tabs = false,
                },
            })
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        main = "ibl",
        opts = {
            scope = { enabled = false },
            indent = { char = "│", tab_char = "│" },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function() require('gitsigns').setup() end,
    }
}
