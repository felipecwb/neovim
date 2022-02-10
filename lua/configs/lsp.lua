
-- override LSP configs
return {
    pylsp = {
        pylsp = {
            plugins = {
                jedi = {
                    extra_paths = { ".", "src" }
                }
            }
        }
    },
    pyright = {
        python = {
            -- venvPath = ".venv",
            analysis = {
                useLibraryCodeForTypes = true,
                extraPaths = { ".", "src" }
            }
        }
    },
    eslintls = {
        format = { enable = true }
    },
}

