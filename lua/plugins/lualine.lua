local module = {}

function module.setup()
    require('lualine').setup({
        extensions = {'fzf', 'nvim-tree', 'nvim-dap-ui'},
    })
end

return module
