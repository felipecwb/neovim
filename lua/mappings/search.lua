
local fn = require 'mappings.fn'

fn.map("n", "n", "nzzzv")
fn.map("n", "N", "Nzzzv")
fn.map("v", "*", ":call visualselection('f')<CR>")
fn.map("v", "#", ":call visualselection('b')<CR>")
fn.map("n", "<Leader><Space>", ":nohlsearch<CR>")

-- telescope grep
fn.map("n", "fd", [[<Cmd> Telescope grep_string<CR>]])

