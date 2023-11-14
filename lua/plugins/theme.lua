return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    config = function()
        require("kanagawa").load("wave")
    end,
}
