return {
    "Exafunction/codeium.vim",
    event = { "BufNewFile", "BufReadPost" },
    lazy = true,
    keys = {
        {"<Leader>ca", function() return vim.fn["codeium#Accept"]() end, desc = "[C]odeium [a]ccept", expr = true, silent = true},
        {"<Leader>cn", function() return vim.fn["codeium#CycleCompletions"](1) end, desc = "[C]odeium [n]ext", expr = true, silent = true},
        {"<Leader>cp", function() return vim.fn["codeium#CycleCompletions"](-1) end, desc = "[C]odeium [p]revious", expr = true, silent = true},
        {"<Leader>cx", function() return vim.fn["codeium#Clear"]() end, desc = "[C]odeium clear", expr = true, silent = true},
        {"<Leader>cd", "<cmd>CodeiumDisable<cr>", desc = "[C]odeium [d]isable", silent = true},
        {"<Leader>ce", "<cmd>CodeiumEnable<cr>", desc = "[C]odeium [e]nable", silent = true},
    },
}
