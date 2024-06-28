return {
    opts = {
        sections = {
            lualine_y = {
                function()
                    return "Codeium: " .. vim.fn["codeium#GetStatusString"]()
                end,
                function()
                    if vim.bo.filetype == "supercollider" then
                        local stat = vim.fn["scnvim#statusline#server_status"]()
                        stat = string.gsub(stat, "[%%us]", "")
                        local avg, peak, ugens, synths = unpack(vim.split(stat, " "))
                        if not avg or not peak or not ugens or not synths then
                            return ""
                        end
                        return "󰽰 Avg:" .. avg .. " Peak:" .. peak .. " UGen:" .. ugens .. " Synth:" .. synths
                    else
                        return ""
                    end
                end,
            },
        },
    },
}
