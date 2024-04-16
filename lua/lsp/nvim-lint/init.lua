return {
    "mfussenegger/nvim-lint",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    event = { "BufNewFile", "BufReadPre" },
    lazy = true,
    keys = {
        {
            "<Leader>lb",
            function()
                require("lint").try_lint()
            end,
            desc = "[L]int [b]uffer",
        },
    },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = { markdown = { "markdownlint" } }
        lint.linters.markdownlint.args = {
            "--disable",
            -- Add rules here
            "MD013", -- line too long
            "MD028", -- No blank line in blockquotes
            "MD041", -- should start with top level header
            "--", -- Required
        }

        -- Hide virtual text for makdownlint for all but errors
        local markdownlint_namespace = lint.get_namespace("markdownlint")
        vim.diagnostic.config({ virtual_text = { severity = vim.diagnostic.severity.ERROR } }, markdownlint_namespace)

        -- Lint on buffer enter, save and leaving insert mode
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("UserLintConfig", { clear = true }),
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
