local module = {}

module.setup = function()
    require('nvim-tree').setup {
        disable_netrw       = true,
        hijack_netrw        = true,
        open_on_setup       = true,
        auto_close          = false,
        open_on_tab         = false,
        update_cwd          = false,
        update_to_buf_dir   = {
            enable = true,
            auto_open = true,
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
        update_focused_file = {
            enable      = true,
            update_cwd  = false,
        },
        system_open = {
            cmd  = "xdg-open",
            args = {}
        },
        filters = {
            dotfiles = false
        },
        git = {
            enable = true,
            ignore = false,
            timeout = 500,
        },
        view = {
            width = 30,
            height = 30,
            auto_resize = false,
            hide_root_folder = false,
            side = 'left',
            mappings = {
                custom_only = false,
                list = {}
            },
            number = false,
            signcolumn = "yes"
        },
        trash = {
            cmd = "trash",
            require_confirm = true
        }
    }
end

return module
