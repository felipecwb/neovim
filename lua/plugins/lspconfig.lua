local module = {}

local configs = require 'configs.lsp'
local mappings = require 'mappings.lsp'

function configs.servers_list()
    local servers = {}
    for server, _ in pairs(configs.servers) do table.insert(servers, server) end
    return servers
end

local function on_attach(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true, buffer = bufnr }
    for key, cmd in pairs(mappings or {}) do
        vim.keymap.set('n', key, cmd, opts)
    end
end

function module.setup()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local lspconfig = require "lspconfig"

    -- mason
    mason.setup {
        PATH = 'append',
        pip = { upgrade_pip = true },
        ui = configs.ui.mason,
    }
    mason_lspconfig.setup {
        ensure_installed = configs.servers_list(),
        automatic_installation = true,
    }

    -- diagnostics
    vim.diagnostic.config({
        severity_sort = true,
        virtual_text = { prefix = configs.ui.diagnostic.prefix, source = "if_many" },
        float = { border = configs.ui.diagnostic.border, source = "if_many" },
    })
    for type, icon in pairs(configs.ui.diagnostic.signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    -- diagnostics disabled for certain extensions
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = configs.disabled_extensions,
      group = vim.api.nvim_create_augroup("diagnostic_disabled_extensions", {clear=true}),
      callback = function(args) vim.diagnostic.disable(args.buf) end
    })

    -- lspconfig
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp = pcall(require, 'cmp_nvim_lsp')
    if ok then
        capabilities = cmp.default_capabilities(capabilities)
    end

    for server, config in pairs(configs.servers) do
        config.flags = configs.flags
        config.capabilities = capabilities
        config.on_attach = on_attach

        lspconfig[server].setup(config)
    end
end

return module
