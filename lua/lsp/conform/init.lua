return {
    "stevearc/conform.nvim",
    keys = {
        {
            "<Leader>fb",
            function()
                require("conform").format({ lsp_fallback = true })
            end,
            { "n", "v" },
            desc = "[F]ormat [b]uffer",
        },
    },
    opts = {
        formatters_by_ft = { markdown = { "prettier" } },
    },
}
