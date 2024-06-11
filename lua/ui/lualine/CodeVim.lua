return {
    opts = {
        sections = {
            lualine_y = { function()
                return "Codeium: " .. vim.fn["codeium#GetStatusString"]()
            end },
        },
    },
}
