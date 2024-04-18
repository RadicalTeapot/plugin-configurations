return {
    -- TODO Configure autocmd using utils (similar to nvim-lint)
    config = function()
        -- Configure LSPs here
        local lspconfig = require("lspconfig")
        lspconfig.marksman.setup({})
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            -- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            vim.env.RUNTIME,
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
        lspconfig.powershell_es.setup({})
        lspconfig.omnisharp.setup({}) -- Check https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp for setup instructions
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
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
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
