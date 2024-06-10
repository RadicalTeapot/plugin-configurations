-- See here https://www.josean.com/posts/nvim-treesitter-and-textobjects
-- and here https://github.com/nvim-treesitter/nvim-treesitter-textobjects
return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        textobjects = {
            -- select = {
            --     enable = true,
            --     lookahead = true, -- if query not found at cursor, jump to next closest match
            --     keymaps = {
            --         ["ih"] = { query = "@heading.inner", desc = "Inner heading" },
            --         ["ah"] = { query = "@heading.outer", desc = "Outer heading" },
            --     },
            -- },
            -- move = {
            --     enable = true,
            --     set_jumps = true, -- Add jump to jumplist
            --     goto_next_start = {
            --         ["]h"] = { query = "@heading.outer", desc = "Next heading start" },
            --     },
            --     goto_next_end = {
            --         ["]H"] = { query = "@heading.outer", desc = "Next heading end" },
            --     },
            --     goto_previous_start = {
            --         ["[h"] = { query = "@heading.outer", desc = "Previous heading start" },
            --     },
            --     goto_previous_end = {
            --         ["[H"] = { query = "@heading.outer", desc = "Previous heading end" },
            --     },
            -- },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
