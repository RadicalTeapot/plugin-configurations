return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        globalstatus = true,
        options = {
            theme = 'gruvbox',
            component_separators = {},
            section_separators = {},
        }
    },
}
