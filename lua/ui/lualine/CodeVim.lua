return {
    opts = {
        sections = {
            lualine_y = {
                function()
                    return ""
                    -- return vim.cmd("Copilot status") or "Copilot: Disabled"
                end,
            },
        },
    },
}
