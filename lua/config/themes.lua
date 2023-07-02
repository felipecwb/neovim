local M = {}

function M.setup(theme, style)
    if theme == 'onedark' then
        require('onedark').setup({style = (style or 'darker')})
    end

    vim.cmd('colorscheme ' .. theme)
end

return M
