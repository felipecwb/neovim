local fn = require 'mappings.fn'

-- buffers
fn.map("n", "<TAB>", [[<Cmd> BufferLineCycleNext<CR>]])
fn.map("n", "<S-TAB>", [[<Cmd> BufferLineCyclePrev<CR>]])

fn.map("n", "<C-q>", ":bp<bar>sp<bar>bn<bar>bd! <CR>")

fn.map("n", "<S-t>", ":tabnew<CR>")
fn.map("n", "<S-Esc>", ":bd!<CR>")

-- move windows
fn.map("n", "<C-Up>", "<C-w>k")
fn.map("n", "<C-Down>", "<C-w>j")
fn.map("n", "<C-Left>", "<C-w>h")
fn.map("n", "<C-Right>", "<C-w>l")

-- nvimtree
fn.map("n", "<C-e>", ":NvimTreeToggle<CR>")
fn.map("n", "<A-e>", ":NvimTreeFindFile<CR>")

-- terminal
fn.map("n", "<leader>sh", [[<Cmd>belowright split | resize 10 | terminal <CR>i]])
