return {
    "ggandor/leap.nvim",
    lazy = false, -- No need for lazy loading (as per plugin README)
    config = function()
        require("leap").setup({})
        vim.keymap.set({ "n", "x", "o" }, "<leader>lf", "<Plug>(leap-forward)", { desc = "[L]eap [f]orward" })
        vim.keymap.set({ "n", "x", "o" }, "<leader>lb", "<Plug>(leap-backward)", { desc = "[L]eap [b]ackward" })
        vim.keymap.set({ "n", "x", "o" }, "<leader>lw", "<Plug>(leap-from-window)", { desc = "[L]eap from [w]indow" })
    end,
}
