return {
    "morhetz/gruvbox",
    lazy = false, -- make sure to load at startup as this is the main colorscheme
    priority = 1000, -- load before all other start plugins
    name = "gruvbox", -- set custom name (used in :colorscheme command)
    config = function(_)
        vim.g.gruvbox_italic = 1
        vim.g.gruvbox_bold = 1
        vim.cmd("colorscheme gruvbox") -- set colorscheme
    end,
}

