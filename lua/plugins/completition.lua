return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim',
        },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            local lspkind = require 'lspkind'

            local function next_item(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end

            local function previous_item(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end

            cmp.setup({
                sources = cmp.config.sources({
                    { name = "copilot", group_index = 3 },
                    { name = 'nvim_lsp', group_index = 2 },
                    { name = 'luasnip', group_index = 1 },
                }, {
                    { name = 'buffer' },
                    { name = 'path' },
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        symbol_map = { Copilot = "" },
                    })
                },
                completion = { completeopt = 'menu,menuone,noinsert' },
                mapping = {
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<Tab>'] = cmp.mapping(next_item, { "i", "s" }),
                    ['<S-Tab>'] = cmp.mapping(previous_item, { "i", "s" }),
                    ['<Down>'] = cmp.mapping(next_item, { "i", "s" }),
                    ['<Up>'] = cmp.mapping(previous_item, { "i", "s" }),
                    ['<Esc>'] = cmp.mapping.close(),
                    ['<Right>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true
                    }),
                },
            })
        end,
    }
}
