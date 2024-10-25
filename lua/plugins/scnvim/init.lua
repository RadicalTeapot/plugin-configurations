local utils = require("plugins.scnvim.utils")
return {
    "davidgranstrom/scnvim",
    lazy = false,
    ft = "supercollider",
    opts = {
        sclang = {
            cmd = "C:/Program Files/SuperCollider-3.13.0/sclang.exe",
        },
        documentation = {
            cmd = "pandoc",
        },
        -- postwin = { float = { enabled = true } },
    },
    config = function(_, opts)
        require("scnvim").setup(opts)
        vim.g.scnvim_scdoc = 1 -- Browse docs in Neovim
        utils.setup()
    end,
}
