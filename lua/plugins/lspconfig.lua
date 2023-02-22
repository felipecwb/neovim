local module = {}

local defaults = {
    servers = require "configs.lsp",
    flags = { debounce_text_changes = 200 },
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    mappings = {
        gD = vim.lsp.buf.declaration,
        gd = vim.lsp.buf.definition,
        gi = vim.lsp.buf.implementation,
        gr = vim.lsp.buf.references,
        K = vim.lsp.buf.hover,
        ['<C-k>'] = vim.lsp.buf.signature_help,
        ['<space>D'] = vim.lsp.buf.type_definition,
        ['<space>f'] = function() vim.lsp.buf.format { async = true } end,
        ['<space>rn'] = vim.lsp.buf.rename,
        ['<space>ca'] = vim.lsp.buf.code_action,
        ['<space>e'] = vim.diagnostic.open_float,
        ['<space>q'] = vim.diagnostic.setloclist,
        ['[d'] = vim.diagnostic.goto_prev,
        [']d'] = vim.diagnostic.goto_next,
    },
}

function defaults.servers_list()
    local servers = {}
    for server, _ in pairs(defaults.servers) do table.insert(servers, server) end
    return servers
end

local function on_attach(client, bufnr)
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
    mason.setup { ui = defaults.ui }
    mason_lspconfig.setup {
        ensure_installed = defaults.servers_list(),
        automatic_installation = true,
    }

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
