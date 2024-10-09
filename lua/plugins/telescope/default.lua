return {
    cmd = "Telescope",
    keys = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        return {
            { "<leader>tf", builtin.find_files, desc = "[T]elescope find [f]ile" },
            { "<leader>tb", builtin.buffers, desc = "[T]elescope [b]uffers" },
            { "<leader>tg", telescope.extensions.live_grep_args.live_grep_args, desc = "[T]elescope live [g]rep" },
            { "<leader>th", builtin.help_tags, desc = "[T]elescope [h]elp tags" },
            { "<leader>tr", builtin.oldfiles, desc = "[T]elescope [r]ecent files" },
            { "<leader>tk", builtin.keymaps, desc = "[T]elescope [k]eymaps" },
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("live_grep_args")
    end,
}
