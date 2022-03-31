
--[[
Intalled Servers:
    - bashls
    - ccls (c, c++, objective-c)
    - clojure_lsp
    - cmake
    - dockerls
    - jsonls
    - pylsp (python)
    - sumneko_lua (lua)
]]

-- override LSP configs
return {
    pylsp = {
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

