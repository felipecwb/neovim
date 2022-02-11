
-- override LSP configs
return {
    pylsp = {
        pylsp = {
            plugins = {
                jedi = {
                    extra_paths = { ".", "src" }
                },
                flake8 = { enabled = true },
                pylint = { enabled = true },
                pydocstyle = { enabled = true },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
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

