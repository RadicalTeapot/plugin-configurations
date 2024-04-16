return {
    "RRethy/vim-illuminate",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function(_, opts)
        require("illuminate").configure(opts)
    end,
}
