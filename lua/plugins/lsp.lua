return {
    {
        'williamboman/mason.nvim',
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
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
        },
        config = function()
            local lsp_config = require 'config.lsp'
            local mappings = require 'mappings.lsp'
            local lspconfig = require "lspconfig"

            local function on_attach(_, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                local opts = { noremap = true, silent = true, buffer = bufnr }
                for key, cmd in pairs(mappings or {}) do
                    vim.keymap.set('n', key, cmd, opts)
                end
            end


            -- mason lspconfig
            require("mason-lspconfig").setup {
                ensure_installed = lsp_config.servers_list(),
                automatic_installation = true,
            }

            -- diagnostics
            vim.diagnostic.config({
                severity_sort = true,
                signs = true,
                underline = true,
                virtual_text = { prefix = lsp_config.ui.diagnostic.prefix, source = false },
                float = { border = lsp_config.ui.diagnostic.border, source = "always", focusable = true },
            })
            for type, icon in pairs(lsp_config.ui.diagnostic.signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- diagnostics disabled for certain extensions
            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = lsp_config.disabled_extensions,
                group = vim.api.nvim_create_augroup("diagnostic_disabled_extensions", { clear=true }),
                callback = function(args) vim.diagnostic.disable(args.buf) end
            })

            -- lspconfig
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp = pcall(require, 'cmp_nvim_lsp')
            if ok then
                capabilities = cmp.default_capabilities(capabilities)
            end

            for server, config in pairs(lsp_config.servers) do
                config.flags = lsp_config.flags
                config.capabilities = capabilities
                config.on_attach = on_attach

                lspconfig[server].setup(config)
            end
        end,
    },
}
