return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 100,
    config = function()
        require("kanagawa").load("wave")
    end,
}
