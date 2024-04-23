return {
    "stevearc/conform.nvim",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim", },
    keys = {
        {
            "<Leader>bf",
            function()
                require("conform").format({ lsp_fallback = true })
            end,
            { "n", "v" },
            desc = "[B]uffer [f]ormat",
        },
    },
}
