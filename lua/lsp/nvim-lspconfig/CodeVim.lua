return {
    -- TODO Configure autocmd using utils (similar to nvim-lint)
    config = function()
        -- Configure LSPs here
        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            -- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            vim.env.VIMRUNTIME,
                        },
                    },
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                },
            },
            root_dir = function()
                return vim.fn.getcwd()
            end,
        })

        -- Check https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp 
        -- and https://vi.stackexchange.com/questions/43830/how-to-use-omnisharp-c-lsp-with-mason-in-nvim-properly for 
        -- setup instructions
        lspconfig.omnisharp.setup({
            cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
            settings = {
                FormattingOptions = {
                    -- Enables support for reading code style, naming convention and analyzer
                    -- settings from .editorconfig.
                    EnableEditorConfigSupport = true,
                    -- Specifies whether 'using' directives should be grouped and sorted during
                    -- document formatting.
                    OrganizeImports = nil,
                },
                MsBuild = {
                    -- If true, MSBuild project system will only load projects for files that
                    -- were opened in the editor. This setting is useful for big C# codebases
                    -- and allows for faster initialization of code navigation features only
                    -- for projects that are relevant to code that is being edited. With this
                    -- setting enabled OmniSharp may load fewer projects and may thus display
                    -- incomplete reference lists for symbols.
                    LoadProjectsOnDemand = nil,
                },
                RoslynExtensionsOptions = {
                    -- Enables support for roslyn analyzers, code fixes and rulesets.
                    EnableAnalyzersSupport = nil,
                    -- Enables support for showing unimported types and unimported extension
                    -- methods in completion lists. When committed, the appropriate using
                    -- directive will be added at the top of the current file. This option can
                    -- have a negative impact on initial completion responsiveness,
                    -- particularly for the first few completion sessions after opening a
                    -- solution.
                    EnableImportCompletion = nil,
                    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                    -- true
                    AnalyzeOpenDocumentsOnly = nil,
                },
                Sdk = {
                    -- Specifies whether to include preview versions of the .NET SDK when
                    -- determining which version to use for project loading.
                    IncludePrereleases = true,
                },
            },
        })

        lspconfig.marksman.setup({})
        lspconfig.powershell_es.setup({})
        lspconfig.tsserver.setup({})

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set({ "n", "i" }, "<c-s>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set("n", "<Leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            end,
        })
    end,
}
