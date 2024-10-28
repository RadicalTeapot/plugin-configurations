return {
    "catppuccin/nvim",
    lazy = false, -- make sure to load at startup as this is the main colorscheme
    priority = 1000, -- load before all other start plugins
    name = "catppuccin", -- set custom name (used in :colorscheme command)
    opts = {
        flavor = "mocha",
        background = { light = "latte", dark = "mocha" }, -- used when :set background=light / dark
    },
    config = function(_, opts)
        require("catppuccin").setup(opts) -- load plugin with opts
        vim.cmd("colorscheme catppuccin") -- set colorscheme
    end,
}
