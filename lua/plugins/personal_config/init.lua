local personal_config = vim.fs.normalize("$localappdata/_nvim_personal_config/personal_config")
if (vim.uv or vim.loop).fs_stat(personal_config) then
    return {
        dir = personal_config,
        opts = {
            statusline = false,
            keymaps = true,
        },
        priority = 999,
        lazy = false,
    }
end

vim.notify("Could not find personal config plugin in " .. personal_config, vim.log.levels.WARN)
return {}
