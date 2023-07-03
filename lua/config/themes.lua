local M = {}

function M.setup(theme, style)
    if theme == 'onedark' then
        require('onedark').setup({ style = (style or 'darker') })
    end

    if theme == 'tokyonight' then
        require('tokyonight').setup({ style = (style or 'storm') })
    end

    if theme == 'kanagawa' then
        require('kanagawa').setup({
            compile = true, theme = (style or 'wave')
        })
    end

    vim.cmd('colorscheme ' .. theme)
end

return M
