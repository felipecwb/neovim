local module = {}

module.setup = function()
    -- vim.opt.completeopt = "menu,menuone,noselect"

    local cmp = require 'cmp'

    cmp.setup({
        mapping = {
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
        }, {
            { name = 'buffer' },
            { name = 'path' },
        })
    })
end

return module
