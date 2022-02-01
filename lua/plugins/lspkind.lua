local module = {}

module.setup = function()
    local lspkind = require 'lspkind'

    lspkind.init({
      formatting = {
        format = lspkind.cmp_format({
          with_text = false,
          maxwidth = 50,
          -- before = function (entry, vim_item)
          --   return vim_item
          -- end
        })
      }
    })
end

return module
