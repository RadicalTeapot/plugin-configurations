return {
    "folke/twilight.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = { { "<Leader>zt", "<cmd>Twilight<cr>", desc = "[T]wilight" } },
    opts = {
        dimming = {
            alpha = 0.5,
        },
        context = 1, -- Lookup one line above and below cursor for context
        expand = {
            "paragraph",
            "list",
            "fenced_code_block",
        },
    },
}
