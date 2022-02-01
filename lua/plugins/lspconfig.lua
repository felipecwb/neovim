local module = {}

local custom_server_opts = require 'configs.lsp'

local setup_servers = function()
    local lsp_installer = require("nvim-lsp-installer")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    lsp_installer.on_server_ready(function(server)
        local opts = { capabilities = capabilities }

        if custom_server_opts[server.name] then
            custom_server_opts[server.name](opts)
        end

        server:setup(opts)
    end)
end


module.setup = function()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<space>do', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    -- replace the default lsp diagnostic letters with prettier symbols
    vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
    vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
    vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
    vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

    setup_servers()
end

return module
