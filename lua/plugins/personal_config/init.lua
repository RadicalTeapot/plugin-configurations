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
    vim.notify("Could not find personal config plugin in " .. path, vim.log.levels.WARN)
end

return dev_plugins
