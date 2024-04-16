return {
    event = "VeryLazy",
    config = function()
        -- Override timeout values (in config rather than init so it happens when plugin is loaded)
        vim.opt.timeout = true
        vim.opt.timeoutlen = 300
        require("which-key").setup()
    end,
}
