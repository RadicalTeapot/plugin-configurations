return {
    "mfussenegger/nvim-lint",
    dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
    event = { "BufNewFile", "BufReadPre" },
    lazy = true,
    keys = {
        {
            "<Leader>bl",
            function()
                require("lint").try_lint()
            end,
            desc = "[B]uffer [l]int",
        },
    },
}
