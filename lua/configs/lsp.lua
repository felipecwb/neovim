
-- override LSP configs
return {
    ["pyright"] = function(opts)
        opts.settings = {
            python = {
                -- venvPath = ".venv",
                analysis = {
                    useLibraryCodeForTypes = true,
                    extraPaths = { ".", "./src" }
                }
            }
        }
    end,
    ["eslintls"] = function(opts)
        opts.settings = {
            format = { enable = true }
        }
    end,
}

