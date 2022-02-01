
-- override LSP configs
return {
    ["eslintls"] = function(opts)
        opts.settings = {
            format = { enable = true }
        }
    end,
}

