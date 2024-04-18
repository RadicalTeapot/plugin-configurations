return {
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            typescript = { { "prettier", "prettierd" } },
            markdown = { { "prettier", "prettierd" } },
            cs = { "csharpier" },
        },
        formatters = {
            prettier = {
                prepend_args = { "--use-tabs", "false", "--tab-width", "4" },
            },
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
        },
    },
}
