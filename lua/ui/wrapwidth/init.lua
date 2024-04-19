local function wrap_on()
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.cmd([[Wrapwidth 120]])

    -- Make motions work on visual lines
    vim.keymap.set("n", "j", "gj", { buffer = true })
    vim.keymap.set("n", "k", "gk", { buffer = true })
    vim.keymap.set("n", "0", "g0", { buffer = true })
    vim.keymap.set("n", "$", "g$", { buffer = true })
    vim.keymap.set("n", "^", "g^", { buffer = true })
end

local function wrap_off()
    vim.wo.wrap = false
    vim.wo.linebreak = false
    vim.cmd([[Wrapwidth 0]])

    -- Make motions work on visual lines
    vim.keymap.del("n", "j", { buffer = true })
    vim.keymap.del("n", "k", { buffer = true })
    vim.keymap.del("n", "0", { buffer = true })
    vim.keymap.del("n", "$", { buffer = true })
    vim.keymap.del("n", "^", { buffer = true })
end

return {
    "rickhowe/wrapwidth",
    lazy = false,
    config = function()
        wrap_on()
    end,
    keys = {
        { "<Leader>bwe", wrap_on, desc = "[B]uffer [w]rap [e]nabled" },
        { "<Leader>bwd", wrap_off, desc = "[B]uffer [w]rap [d]isabled" },
    },
}
