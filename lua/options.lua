vim.opt.wrap = false
vim.opt.ruler = true
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.cursorline = true

vim.opt.termguicolors = true
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }

vim.opt.mouse = 'a'
vim.opt.mousemodel = 'popup'
vim.opt.gcr = 'a:blinkon0'

vim.opt.scrolloff = 3
vim.opt.sidescroll = 3

vim.opt.gfn = 'Hack Nerd Font Mono'
vim.opt.guifont = 'Hack Nerd Font Mono:h12'

vim.opt.autoread = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'
vim.opt.fileformats = { 'unix', 'mac', 'dos' }

vim.opt.bomb = true
vim.opt.binary = true
vim.opt.ttyfast = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0

vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.magic = true

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.dir = { '~/.cache/nvim/swap//', '/tmp/nvim//', '.' }
vim.opt.tags = { '~/.cache/nvim/tag//', '/tmp/nvim//', '' }

vim.opt.list = true
vim.opt.listchars = { tab = '▸→', trail = '·', extends = '❯', precedes = '❮' }
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.showbreak = '↪'

vim.opt.wildmode = 'full'
vim.opt.wildignore:append('*.o,*.obj,.git,*.rbc,*.pyc,__pycache__')

vim.opt.grepprg = 'rg --vimgrep'
vim.opt.grepformat = '%f:%l:%c:%m'

vim.opt.shell = '/usr/bin/zsh'
