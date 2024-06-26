return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
            'jay-babu/mason-nvim-dap.nvim',
            'williamboman/mason.nvim',
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local mason_dapconfig = require('mason-nvim-dap')
            local dap_config = require("config.dap")

            -- setup
            dapui.setup()
            mason_dapconfig.setup({
                ensure_installed = dap_config.installed,
                automatic_installation = true,
                handlers = {
                    function(config)
                        mason_dapconfig.default_setup(config)
                    end,
                    -- python = function(config)
                    --     config.adapters = dap_config.adapters.python()
                    --     mason_dapconfig.default_setup(config)
                    -- end,
                }
            })

            -- binds
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end

            -- vscode config support
            require('dap.ext.vscode').load_launchjs(nil, {})

            -- UI
            for name, icon in pairs(dap_config.ui.signs or {}) do
                vim.fn.sign_define(name, { text = icon, texthl = '', linehl = '', numhl = '' })
            end

            -- keys
            vim.keymap.set('n', '<F4>', dap.toggle_breakpoint)
            vim.keymap.set('n', '<F5>', dap.continue)
            vim.keymap.set('n', '<F10>', dap.step_over)
            vim.keymap.set('n', '<F11>', dap.step_into)
            vim.keymap.set('n', '<F12>', dap.step_out)
        end,
    }
}
