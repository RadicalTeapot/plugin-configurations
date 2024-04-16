return {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        char = "▏",
        virtcolumn = "+0",
    },
    config = function(_, opts)
        require("virt-column").setup(opts)
        -- Disable colorcolumn
        vim.opt.colorcolumn = ""
    end,
}
