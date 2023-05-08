local module = {}

function module.setup()
    require('bufferline').setup({
        options = {
            separator_style = "thick",
            diagnostics = "nvim_lsp",
            indicator = { style = 'underline', icon = '▎' },
            offsets = {{ filetype = "NvimTree", text = "File Explorer" }},
            show_close_icon = true,
            show_tab_indicators = true,
            show_buffer_close_icons = true,
            always_show_bufferline = true,
            enforce_regular_tabs = false,
        }
    })
end

return module
