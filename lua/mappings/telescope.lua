local fn = require 'mappings.fn'

fn.map("n", "<C-p>", [[<Cmd> Telescope find_files <CR>]])
fn.map("n", "<C-f>", [[<Cmd> Telescope live_grep <CR>]])
fn.map("n", "<leader>b", [[<Cmd> Telescope buffers <CR>]])
fn.map("n", "<Leader>t", [[<Cmd> Telescope tags <CR>]])
fn.map("n", "<Leader>h", [[<Cmd> Telescope help_tags <CR>]])
fn.map("n", "<Leader>gs", [[<Cmd> Telescope git_status <CR>]])
fn.map("n", "<Leader>gc", [[<Cmd> Telescope git_commits <CR>]])
