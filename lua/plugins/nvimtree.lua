local module = {}

module.setup = function()
    require("nvim-tree").setup({
        hijack_netrw        = true,
        disable_netrw       = true,
        open_on_tab         = true,
        open_on_setup       = true,
        ignore_ft_on_setup  = {},
        auto_close          = false,
        update_cwd          = false,
        update_to_buf_dir   = {
            enable = true,
            auto_open = false,
        },
        update_focused_file = {
            enable      = false,
            update_cwd  = false,
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
            cmd  = nil,
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
            width = 40,
            height = 30,
            side = 'left',
            hide_root_folder = false,
            auto_resize = false,
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            mappings = {
              custom_only = false,
              list = {}
            },
        },
        actions = {
            change_dir = { global = false },
            open_file = { quit_on_open = false }
        }
    })
end

return module
