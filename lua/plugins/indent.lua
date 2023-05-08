local module = {}

function module.setup()
    require("indent_blankline").setup({
        show_trailing_blankline_indent = true,
        show_first_indent_level = false,
        buftype_exclude = { 'terminal' },
        filetype_exclude = { 'help', 'terminal', 'dashboard' },
    })
end

return module
