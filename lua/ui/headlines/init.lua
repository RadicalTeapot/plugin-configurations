return {
    "lukas-reineke/headlines.nvim",
    enabled = false, -- Re-enable once bug with neovim 0.11.700 is fixed
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        markdown = {
            headline_highlights = false,
        },
    },
    config = function(_, opts)
        vim.cmd([[highlight CodeBlock guibg=#181825]])
        vim.cmd([[highlight @markup.raw.markdown_inline guifg=#94e2d5 guibg=#181825]])
        require("headlines").setup(opts)
    end,
}
