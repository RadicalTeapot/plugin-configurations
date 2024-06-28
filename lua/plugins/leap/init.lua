return {
    "ggandor/leap.nvim",
    lazy = false, -- No need for lazy loading (as per plugin README)
    keys = {
        {"<leader>lf", "<Plug>(leap-forward)", { "n", "x", "o" }, desc = "[L]eap [f]orward"},
        {"<leader>lb", "<Plug>(leap-backward)", { "n", "x", "o" }, desc = "[L]eap [b]ackward"},
        {"<leader>lw", "<Plug>(leap-from-window)", { "n", "x", "o" }, desc = "[L]eap from [w]indow"},
    },
    config = true,
}
