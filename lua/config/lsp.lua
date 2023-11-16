local config = {
    ui = {
        diagnostic = {
            border = "rounded",
            prefix = "▎", -- "●",
            signs = { Error = "", Warn = "", Hint = "", Info = "" },
        },
    },
    flags = { debounce_text_changes = 200 },
    disabled_extensions = {
        "*.env"
    },
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
        gopls = {},
        ruff_lsp = {},
        pyright = {
            settings = {
                python = {
                    analysis = {
                        extraPaths = { ".", "src" },
                        diagnosticMode = "workspace",
                        autoSearchPaths = true,
                        autoImportCompletions = true,
                        useLibraryCodeForTypes = true,
                    }
                }
            }
        },
        rust_analyzer = {},
    },
}


function config.servers_list()
    local servers = {}
    for server, _ in pairs(config.servers) do
        table.insert(servers, server)
    end
    return servers
end

return config
