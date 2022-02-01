
-- abbreviations
vim.api.nvim_exec(
    [[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
    ]],
    true
)

-- other mappings
require 'mappings.editing'
require 'mappings.navigation'
require 'mappings.telescope'
require 'mappings.search'

