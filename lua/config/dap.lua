return {
    ui = {
        signs = {
            DapBreakpoint = '',
            DapStopped = '▶️',
        }
    },
    installed = {
        'debugpy',
        'delve',
    },
    adapters = {
        -- python = function()
        --     return {
        --         type = 'executable',
        --         command = '.venv/bin/python',
        --         args = { '-m', 'debugpy.adapter' },
        --         options = { cwd = vim.fn.getcwd() },
        --     }
        -- end,
    },
}
