return {
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
        hide_root_folder = false,
        -- mappings = {
        --     list = {
        --         { key = "<C-e>", action = "" },
        --     }
        -- }
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
}
