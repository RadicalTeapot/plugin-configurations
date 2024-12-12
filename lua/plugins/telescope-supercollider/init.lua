return {
    "madskjeldgaard/telescope-supercollider.nvim",
    dependencies = {"davidgranstrom/scnvim", "nvim-telescope/telescope.nvim"},
    config = function()
        require("telescope").load_extension("supercollider")
    end,
}
