local M = {}

function M.setup(theme, style)
    if theme == 'onedark' then
        require('onedark').setup({ style = (style or 'darker') })
    end

    if theme == 'material' then
        vim.g.material_style = style or 'palenight'
        require('material').setup({
            lualine_style = 'default', -- 'stealth'
            plugins = {
                'dap',
                'dashboard',
                'gitsigns',
                'indent-blankline',
                'nvim-cmp',
                'nvim-tree',
                'nvim-web-devicons',
                'telescope',
                'trouble',
            }
        })
    end

    vim.cmd('colorscheme ' .. theme)
end

return M
