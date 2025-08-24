return {
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            typescript = { "prettier" },
            markdown = { { "markdownlint", "prettier"  }},
            cs = { "csharpier" },
            sh = { "shfmt" },
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
