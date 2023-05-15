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
                telemetry = { enable = false },
                diagnostics = {
                    globals = { 'vim' },
                },
            }
        }
    },
    pylsp = {
        settings = {
            pylsp = {
                configurationSources = { "flake8", "black", "mypy" },
                plugins = {
                    jedi = {
                        extra_paths = { ".", "src" }
                    },
                    flake8 = {
                        enabled = true,
                        ignore = { "E203", "E241", "W503" },
                    },
                    black = { enabled = true },
                    mypy = { enabled = true, live_mode = false },
                    pylint = { enabled = false },
                    pyflakes = { enabled = false },
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
