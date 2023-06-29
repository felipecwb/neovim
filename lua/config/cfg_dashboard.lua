return {
    theme = 'hyper',
    change_to_vcs_root = true,
    config = {
        shortcut = {
            { group = '@property', key = 'n', desc = " New File", action = 'enew' },
            { group = '@property', key = 'f', desc = " Find Files", action = 'Telescope find_files' },
            { group = '@property', key = 'U', desc = "󰚰 Packer Update", action = 'PackerUpdate' },
        },
    },
}
