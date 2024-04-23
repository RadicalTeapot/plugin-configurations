local personal_config = vim.fs.normalize("$code/neovim/plugins/personal-basics-nvim")
if (vim.uv or vim.loop).fs_stat(personal_config) then
    return {
        dir = personal_config,
        event = "VeryLazy",
        opts = {
            statusline = false,
            colorscheme = false,
        },
    }
end

vim.notify("Could not find personal config plugin in " .. personal_config, vim.log.levels.WARN)
return {}
