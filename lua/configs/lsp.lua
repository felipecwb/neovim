
-- override LSP configs
return {
    pylsp = {
        pylsp = {
            configurationSources = { "pycodestyle", "flake8", "black" },
            plugins = {
                jedi = {
                    extra_paths = { ".", "src" }
                },
                flake8 = { enabled = true },
                pyflakes = { enabled = true },
                pydocstyle = { enabled = false },
                pycodestyle = { enabled = false },
                pylint = { enabled = false },
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

