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
                        local t = {}
                        for match in string.gmatch(stat, "[^%s]+") do -- Match anything that is not white space chars
                            table.insert(t, match)
                        end
                        local headers = {"Avg", "Peak", "Ugens", "Synths"}
                        stat = ""
                        for i, v in ipairs(t) do
                            stat = stat .. " ".. v .. " " .. headers[i]
                        end
                        return stat
                    else
                        return ""
                    end
                end,
            },
        },
    },
}
