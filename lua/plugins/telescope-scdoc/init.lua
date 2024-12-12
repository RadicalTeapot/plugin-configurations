return {
    "davidgranstrom/telescope-scdoc.nvim",
    dependencies = {"davidgranstrom/scnvim", "nvim-telescope/telescope.nvim"},
    config = function()
        require("telescope").load_extension("scdoc")
    end,
}
