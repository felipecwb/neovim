return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        priority = 60,
        config = function ()
            require('mason').setup({
                PATH = 'append',
                pip = { upgrade_pip = true },
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    },
                }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
        },
        config = function()
            local lsp_config = require 'config.lsp'
            local mappings = require 'mappings.lsp'

            -- mason lspconfig
            require("mason-lspconfig").setup {
                ensure_installed = lsp_config.servers_list(),
                automatic_installation = true,
            }

            -- diagnostics
            vim.diagnostic.config({
                severity_sort = true,
                underline = true,
                signs = lsp_config.ui.diagnostic.signs,
                virtual_text = { prefix = lsp_config.ui.diagnostic.prefix, source = false },
                float = { border = lsp_config.ui.diagnostic.border, source = "always", focusable = true },
            })

            -- diagnostics disabled for certain extensions
            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = lsp_config.disabled_extensions,
                group = vim.api.nvim_create_augroup("diagnostic_disabled_extensions", { clear = true }),
                callback = function(args) vim.diagnostic.disable(args.buf) end
            })

            -- attach keybindins
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function (ev)
                    -- Enable completion triggered by <C-x><C-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    local opts = { noremap = true, silent = true, buffer = ev.buf }
                    for key, cmd in pairs(mappings or {}) do
                        vim.keymap.set('n', key, cmd, opts)
                    end
                end
            })

            -- capabilities
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp = pcall(require, 'cmp_nvim_lsp')
            if ok then
                capabilities = cmp.default_capabilities(capabilities)
            end

            vim.lsp.config('*', {
                flags = lsp_config.flags,
                capabilities,
            })

            for server, config in pairs(lsp_config.servers) do
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end
        end,
    },
}
