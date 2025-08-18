return {
    "github/copilot.vim",
    event = { "BufNewFile", "BufReadPost" },
    lazy = true,
    keys = {
        {"<Leader>cd", "<cmd>Copilot disable<cr>", desc = "[C]opilot [d]isable", silent = true},
        {"<Leader>ce", "<cmd>Copilot enable<cr>", desc = "[C]opilot [e]nable", silent = true},
        {"<Leader>cb", "<cmd>Copilot panel<cr>", desc = "[C]opilot [p]anel", silent = true},
    }
}
