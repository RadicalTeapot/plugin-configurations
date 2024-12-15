local M = {}

M.setup = function()
    local kset = vim.keymap.set
    local make_opts = function(desc) return { silent = true, desc = desc } end

    -- Run lines on server
    local editor = require("scnvim.editor")
    kset("n", "<leader>sl", function() editor.send_line(nil, true) end, make_opts("Supercollider send [l]ine"))
    kset("i", "<M-e>", function() editor.send_line(nil, true) end, make_opts("Supercollider send [l]ine"))
    kset("n", "<leader>sb", function() editor.send_block(nil, true) end, make_opts("Supercollider send [b]lock"))
    kset("i", "<C-e>", function() editor.send_block(nil, true) end, make_opts("Supercollider send [b]lock"))
    kset("x", "<leader>ss", function() editor.send_selection(nil, true) end, make_opts("Supercollider send [s]elected block"))

    -- Post window
    local postwin = require("scnvim.postwin")
    kset("n", "<leader>sw", function() postwin.toggle() end, make_opts("Supercollider toggle post [w]indow"))
    kset("i", "<M-CR>", function() postwin.toggle() end, make_opts("Supercollider toggle post [w]indow"))
    kset("n", "<leader>sc", function() postwin.clear() end, make_opts("Supercollider [c]lear post window"))
    kset("i", "<M-L>", function() postwin.clear() end, make_opts("Supercollider [c]lear post window"))

    -- Documentation
    local signature = require("scnvim.signature")
    local help = require("scnvim.help")
    kset("n", "K", function()
        local word_under_cursor = vim.fn.expand("<cword>")
        help.open_help_for(word_under_cursor)
        -- Above is similar to
        -- vim.cmd([[execute "SCNvimHelp" expand("<cword>")]]) -- Run something similar to how keywordprg works
    end, make_opts("Supercollider show signature"))
    kset("n", "<C-K>", function()
        vim.ui.input({prompt = "Help subject"}, function(input)
            if input and input ~= "" then help.open_help_for(input) end
        end)
    end, make_opts("Supercollider show signature"))
    kset({"n", "i"}, "<C-s>", function() signature.show() end, make_opts("Supercollider show signature"))

    -- Language calls
    local sclang = require('scnvim.sclang')
    kset({"i", "n", "x"}, "<F1>", function() sclang.send("s.boot", true) end, make_opts("Supercollider server boot"))
    kset({"i", "n", "x"}, "<leader>sm", function() sclang.send("s.meter(0, 2)", true) end, make_opts("Supercollider [s]erver [m]eter"))
    kset({"i", "n", "x"}, "<leader>sn", function() sclang.send("s.plotTree", true) end, make_opts("Supercollider [s]erver [n]ode tree"))
    kset({"i", "n", "x"}, "<F12>", function() sclang.hard_stop() end, make_opts("Supercollider hard stop"))
    kset("n", "<leader>st", function()
        sclang.start() -- Same as SCNvimStart
        sclang.poll_server_status()
        kset("n", "<leader>tsd", function() require('telescope').extensions.supercollider.sc_definitions() end, make_opts("[T]elescope [s]upercollider [d]efinitions"))
        kset("n", "<leader>tsh", function() require('telescope').extensions.scdoc.scdoc() end, make_opts("[T]elescope [s]upercollider [h]elp"))
    end, make_opts("Supercollider s[t]art sclang"))
    kset("n", "<leader>sp", function()
        sclang.stop() -- Same as SCNvimStop
    end, make_opts("Supercollider sto[p] sclang"))
end

return M
