local dev_plugins_path = "$code/neovim/plugins/"

local dev_plugins = {}

local path = vim.fs.normalize(dev_plugins_path .. "personal-basics-nvim")
if (vim.uv or vim.loop).fs_stat(path) then
    table.insert(dev_plugins, {
        dir = path,
        event = "VeryLazy",
        opts = {
            statusline = false,
            colorscheme = false,
        },
    })
else
    vim.notify("Could not find personal config plugin in " .. path, vim.log.levels.WARN)
end

path = vim.fs.normalize(dev_plugins_path .. "buffer-opener-nvim")
if (vim.uv or vim.loop).fs_stat(path) then
    table.insert(dev_plugins, {
        dir = path,
        cmd = { "OpenWeekDailies", "OpenFileBuffers" },
        config = true,
    })
else
    vim.notify("Could not find buffer opener plugin in " .. path, vim.log.levels.WARN)
end

path = vim.fs.normalize(dev_plugins_path .. "personal-scripts-nvim")
if (vim.uv or vim.loop).fs_stat(path) then
    table.insert(dev_plugins, {
        dir = path,
        keys = {
            { "<Leader>wd", "<cmd>DimWindowsOn<cr>", desc = "[W]indow [d]im enabled" },
            { "<Leader>wD", "<cmd>DimWindowsOff<cr>", desc = "[W]indow [d]im disabled" },
        },
        cmd = {
            "OpenDailyNote",
            "OpenWeeklyNote",
            "OpenMonthlyNote",
            "OpenPlanningLayout",
            "SendToPandoc",
            "DimWindowsOn",
            "DimWindowsOff",
        },
        config = true,
    })
else
    vim.notify("Could not find personal scripts plugin in " .. path, vim.log.levels.WARN)
end

return dev_plugins
