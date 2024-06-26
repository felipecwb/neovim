return {
    { 'tpope/vim-fugitive' },
    { 'liuchengxu/vista.vim',   event = 'BufRead' },
    { 'mg979/vim-visual-multi', event = 'BufRead' },
    { 'andymass/vim-matchup',   event = 'CursorMoved' },
    {
        'terrortylor/nvim-comment',
        cmd = 'CommentToggle',
        config = function()
            require('nvim_comment').setup()
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                indent = { enable = true },
                highlight = {
                    enable = true,
                    use_languagetree = true
                },
                refactor = {
                    highlight_definitions = { enable = true },
                    highlight_current_scope = { enable = true }
                },
                auto_install = true,
                -- ensure_installed = "all",
            })
        end,
    },
}
