return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim',
        },
        event = "InsertEnter",
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
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'treesitter' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'copilot', keyword_length = 2}
                },
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
                    ['<Esc>'] = cmp.mapping.abort(),
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
