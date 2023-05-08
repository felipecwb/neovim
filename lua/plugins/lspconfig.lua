local module = {}

local defaults = {
    servers = require "configs.lsp",
    mappings = require "mappings.lsp",
    flags = { debounce_text_changes = 200 },
    ui = {
        mason = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
        diagnostic = {
            border = "rounded",
            prefix = "▎", -- "●",
            signs = { Error = "", Warn = "", Hint = "", Info = "" },
        },
    },
}

function defaults.servers_list()
    local servers = {}
    for server, _ in pairs(defaults.servers) do table.insert(servers, server) end
    return servers
end

local function on_attach(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true, buffer = bufnr }
    for key, cmd in pairs(defaults.mappings or {}) do
        vim.keymap.set('n', key, cmd, opts)
    end
end

function module.setup()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local lspconfig = require "lspconfig"

    -- mason
    mason.setup { ui = defaults.ui.mason }
    mason_lspconfig.setup {
        ensure_installed = defaults.servers_list(),
        automatic_installation = true,
    }

    -- diagnostics
    vim.diagnostic.config({
        severity_sort = true,
        virtual_text = { prefix = defaults.ui.diagnostic.prefix, source = "if_many" },
        float = { border = defaults.ui.diagnostic.border, source = "if_many" },
    })
    for type, icon in pairs(defaults.ui.diagnostic.signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- lspconfig
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp = pcall(require, 'cmp_nvim_lsp')
    if ok then
        capabilities = cmp.default_capabilities(capabilities)
    end

    for server, config in pairs(defaults.servers) do
        config.flags = defaults.flags
        config.capabilities = capabilities
        config.on_attach = on_attach

        lspconfig[server].setup(config)
    end
end

return module
