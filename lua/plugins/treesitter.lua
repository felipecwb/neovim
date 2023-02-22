local module = {}

function module.setup()
    require('nvim-treesitter.configs').setup {
        ensure_installed = require 'configs.treesitter',
        auto_install = true,
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
