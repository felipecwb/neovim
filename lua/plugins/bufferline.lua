local module = {}

function module.setup()
    require('bufferline').setup({
        options = {
            diagnostics = "nvim_lsp",
            -- separator_style = 'slant',
            separator_style = 'thick',
            indicator = { style = 'icon', icon = ' ' },
            offsets = {{ filetype = "NvimTree", text = "File Explorer", text_align = "center" }},
            show_close_icon = true,
            show_tab_indicators = true,
            show_buffer_close_icons = true,
            always_show_bufferline = true,
            enforce_regular_tabs = false,
        }
    })
end

return module
