return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- Add markdown support
        ensure_installed = { "markdown", "markdown_inline", "lua", "luadoc", "supercollider" },
        -- Disable auto-install (add required packages above and run :TSUpdate instead)
        auto_install = false,
        sync_install = true,
        highlight = {
            enable = true,
            -- uses :h syntax if true, disabled due to potential slowdown
            additional_vim_regex_highlighting = false,
        },
        indent = { true },
    },
    config = function(_, opts)
        -- This is required (lazy won't call setup on the right object by itself)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
