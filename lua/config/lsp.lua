local config = {
    ui = {
        diagnostic = {
            border = "rounded",
            prefix = "▎", -- "●",
            signs = {
                error = { text = "", texthl = "DiagnosticSignError" },
                warn = { text = "", texthl = "DiagnosticSignWarn" },
                hint = { text = "", texthl = "DiagnosticSignHint" },
                info = { text = "", texthl = "DiagnosticSigninfo" },
            }
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
        -- cmake = {},
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
        ruff = {},
        -- basedpyright = {
        pyright = {
            settings = {
                python = {
                    venvPath = ".venv",
                    analysis = {
                        extraPaths = { "src" },
                        diagnosticMode = "openFilesOnly",
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
