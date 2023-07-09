local module = {}

local config = require("config.cfg_dap")

function module.setup()
    local dap = require("dap")
    local dapui = require("dapui")
    local mason_dapconfig = require('mason-nvim-dap')

    -- setup
    dapui.setup()
    mason_dapconfig.setup({
        ensure_installed = config.installed,
        automatic_installation = true,
        handlers = {
            function(_config)
                require('mason-nvim-dap').default_setup(_config)
            end,
        }
    })

    -- binds
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end

    -- vscode config support
    require('dap.ext.vscode').load_launchjs(nil, {})

    -- UI
    for name, icon in pairs(config.ui.signs or {}) do
        vim.fn.sign_define(name, { text = icon, texthl = '', linehl = '', numhl = '' })
    end

    -- keys
    vim.keymap.set('n', '<F4>',  dap.toggle_breakpoint)
    vim.keymap.set('n', '<F5>',  dap.continue)
    vim.keymap.set('n', '<F10>', dap.step_over)
    vim.keymap.set('n', '<F11>', dap.step_into)
    vim.keymap.set('n', '<F12>', dap.step_out)
end

return module
