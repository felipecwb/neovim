local fn = require 'mappings.fn'

-- dont copy any deleted/substitute text
fn.map("n", "d", "\"_d")
fn.map("v", "d", "\"_d")
fn.map("n", "D", "\"_D")
fn.map("v", "D", "\"_D")
fn.map("n", "s", "\"_s")
fn.map("v", "s", "\"_s")
fn.map("n", "S", "\"_S")
fn.map("v", "S", "\"_S")
fn.map("n", "<Leader>d", "\"+d")
fn.map("n", "<Leader>D", "\"+D")
fn.map("v", "<Leader>d", "\"+d")
fn.map("v", "<Leader>D", "\"+D")
fn.map("n", "<Leader>s", "\"+s")
fn.map("n", "<Leader>S", "\"+S")
fn.map("v", "<Leader>s", "\"+s")
fn.map("v", "<Leader>S", "\"+S")

-- select whole content
fn.map("n", "<C-a>", "ggVG")

-- save
fn.map("n", "<C-s>", ":w <CR>")

-- Commenter Keybinding
fn.map("n", "<Leader>/", ":CommentToggle<CR>")
fn.map("v", "<Leader>/", ":CommentToggle<CR>")

-- reselect with indent
fn.map("v", "<", "<gv")
fn.map("v", ">", ">gv")

-- duplicate lines
fn.map("v", "<C-d>", [["1y"1P]])
fn.map("n", "<C-d>", [["1Y"1P]])

-- Move visual block
fn.map("n", "<S-Up>", ":move -2<CR>")
fn.map("n", "<S-Down>", ":move +1<CR>")
fn.map("v", "<S-Up>", ":'<,'>move '<-2<CR>gv")
fn.map("v", "<S-Down>", ":'<,'>move '>+1<CR>gv")

-- vim-visual-multi: mappings
vim.g.VM_maps = {
    ['Add Cursor Up']   = '<A-S-Up>',
    ['Add Cursor Down'] = '<A-S-Down>',
}
