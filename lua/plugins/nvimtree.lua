local module = {}

function module.setup()
    local nvimtree = require "nvim-tree"
    local api = require "nvim-tree.api"

    nvimtree.setup({
        hijack_netrw = true,
        disable_netrw = true,
        open_on_tab = true,
        update_cwd = false,
        update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {},
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
        view = {
            width = 45,
            number = false,
            side = 'left',
            signcolumn = "yes",
            relativenumber = false,
            hide_root_folder = false,
            mappings = {
                custom_only = false,
                list = {}
            },
        },
        actions = {
            open_file = { quit_on_open = false },
            change_dir = { global = false },
        }
    })

    vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function() api.tree.open() end
    })
end

return module
