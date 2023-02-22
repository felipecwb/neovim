local module = {}

function module.setup()
    require('bufferline').setup({
        options = {
            offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
            view = "multiwindow",
            separator_style = "slant",
            show_close_icon = true,
            show_tab_indicators = true,
            show_buffer_close_icons = true,
            always_show_bufferline = true,
            enforce_regular_tabs = false,
            diagnostics = false,
        }
    })
end

return module
