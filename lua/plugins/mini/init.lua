return {
    {
        "echasnovski/mini.pairs",
        version = "*",
        event = { "InsertEnter" },
        config = true,
        enabled = false,
    },
    {
        "echasnovski/mini.surround",
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            mappings = {
                add = "<leader>sa", -- Add surrounding
                delete = "<leader>sd", -- Delete surrounding
                find = "<leader>sf", -- Find surrounding (to the right)
                find_left = "<leader>sF", -- Find surrounding (to the left)
                highlight = "<leader>sh", -- Highlight surrounding
                replace = "<leader>sr", -- Replace surrounding
                update_n_lines = "<leader>sn", -- Update `n_lines`
            },
        },
    },
}
