return {
    bashls = {},
    clangd = {},
    clojure_lsp = {},
    cmake = {},
    dockerls = {},
    jsonls = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                },
                telemetry = {
                    enable = false,
                }
            }
        }
    },
    pylsp = {
        settings = {
            pylsp = {
                configurationSources = { "pycodestyle", "flake8", "black" },
                plugins = {
                    jedi = {
                        extra_paths = { ".", "src" }
                    },
                    flake8 = {
                        enabled = true,
                        ignore = { "E203", "E241", "W503" },
                    },
                    black = { enabled = true },
                    pyflakes = { enabled = true },
                    mypy = { enabled = true },
                    pylint = { enabled = false },
                    pycodestyle = { enabled = false },
                    pydocstyle = { enabled = false },
                }
            }
        }
    },
    eslint = {
        settings = {
            format = { enable = true }
        }
    },
}
