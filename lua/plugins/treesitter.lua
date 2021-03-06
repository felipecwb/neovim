local module = {}

module.setup = function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = require 'configs.treesitter',
        highlight = {
            enable = true,
            use_languagetree = true
        },
        indent = {
            enable = true
        },
        refactor = {
            highlight_definitions = { enable = true },
            highlight_current_scope = { enable = true }
        }
    }
end

return module
