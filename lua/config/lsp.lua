return {
    ui = {
        diagnostic = {
            border = "rounded",
            prefix = "▎", -- "●",
            signs = { Error = "", Warn = "", Hint = "", Info = "" },
        },
    },
    flags = { debounce_text_changes = 200 },
    disabled_extensions = { "*.env" },
    servers = {
        bashls = {},
        clangd = {},
        clojure_lsp = {},
        cmake = {},
        dockerls = {},
        eslint = {
            settings = {
                format = { enable = true }
            }
        },
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
        pyright = {
            settings = {
                python = {
                    analysis = {
                        extraPaths = {".", "src"},
                        diagnosticMode = "workspace",
                        autoSearchPaths = true,
                        autoImportCompletions = true,
                        useLibraryCodeForTypes = true,
                    }
                }
            }
        },
        -- ruff_lsp = {},
        -- pylsp = {
        --     settings = {
        --         pylsp = {
        --             configurationSources = { "flake8", "black", "mypy" },
        --             plugins = {
        --                 jedi = {
        --                     extra_paths = { ".", "src" }
        --                 },
        --                 flake8 = {
        --                     enabled = false,
        --                     ignore = { "E203", "E241", "W503" },
        --                 },
        --                 black = { enabled = true },
        --                 mypy = { enabled = false, live_mode = false },
        --                 pylint = { enabled = false },
        --                 pyflakes = { enabled = false },
        --                 pycodestyle = { enabled = false },
        --                 pydocstyle = { enabled = false },
        --             }
        --         }
        --     }
        -- },
    },
}
