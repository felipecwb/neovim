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
}
