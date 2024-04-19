return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- Disable lazy loading as it might cause some issues with runtime path order when loading query.lua, figure out if it can be avoided
    lazy = false,
    opts = {
        -- First 5 have to be installed for treesitter to function properly
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" --[[, "supercollider" --]] },
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
