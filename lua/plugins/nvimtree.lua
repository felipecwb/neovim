local module = {}

local function on_attach(bufnr)
    local api = require('nvim-tree.api')
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- close when in buffer
    vim.keymap.del('n', '<C-e>', { buffer = bufnr })
    vim.keymap.set('n', '<C-e>', api.tree.close, { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

function module.setup()
    local config = require('configs.nvimtree')
    config.on_attach = on_attach
    require("nvim-tree").setup(config)

    -- Startup Open
    -- local api = require "nvim-tree.api"
    -- vim.api.nvim_create_autocmd({ "VimEnter" }, {
    --     callback = function() api.tree.open() end
    -- })
end

return module
