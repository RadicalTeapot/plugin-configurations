return {
    "nvim-treesitter/nvim-treesitter",
    commit = "8ce94cb53741c5038ceac239372cafd16c8b5a85", -- TEMP: use this commit until this https://github.com/nvim-treesitter/nvim-treesitter/pull/7114 is merged
    build = ":TSUpdate",
    -- Disable lazy loading as it might cause some issues with runtime path order when loading query.lua, figure out if it can be avoided
    lazy = false,
    opts = {
        -- First 5 have to be installed for treesitter to function properly
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
        },
        -- Disable auto-install (add required packages above and run :TSUpdate instead)
        auto_install = false,
        sync_install = true,
        highlight = {
            enable = true,
            -- uses :h syntax if true, disabled due to potential slowdown
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },
    config = function(_, opts)
        -- This is required (lazy won't call setup on the right object by itself)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
