local M = {}

M.set_autcmd = function()
    local group = vim.api.nvim_create_augroup("SupercolliderConfig", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*.scd", "*.sc" },
        group = group,
        callback = function(ev)
            local kset = vim.keymap.set
            local make_opts = function(desc)
                return { buffer = ev.buf, silent = true, desc = desc }
            end

            -- Run lines on server
            local editor = require("scnvim.editor")
            kset("n", "<leader>sl", function()
                editor.send_line(nil, true)
            end, make_opts("Supercollider send [l]ine"))
            kset("i", "<M-e>", function()
                editor.send_line(nil, true)
            end, make_opts("Supercollider send [l]ine"))
            kset("n", "<leader>sb", function()
                editor.send_block(nil, true)
            end, make_opts("Supercollider send [b]lock"))
            kset("i", "<C-e>", function()
                editor.send_block(nil, true)
            end, make_opts("Supercollider send [b]lock"))
            kset("x", "<leader>sb", function()
                editor.send_block(nil, true)
            end, make_opts("Supercollider send selected [b]lock"))

            -- Post window
            local postwin = require("scnvim.postwin")
            kset("n", "<leader>sw", function()
                postwin.toggle()
            end, make_opts("Supercollider toggle post [w]indow"))
            kset("i", "<M-CR>", function()
                postwin.toggle()
            end, make_opts("Supercollider toggle post [w]indow"))
            kset("n", "<leader>sc", function()
                postwin.toggle()
            end, make_opts("Supercollider [c]lear post window"))
            kset("i", "<M-L>", function()
                postwin.toggle()
            end, make_opts("Supercollider [c]lear post window"))

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
                local term = vim.ui.input({ prompt = "Help subject" }, function(input)
                    if input and input ~= "" then
                        help.open_help_for(input)
                    end
                end)
            end, make_opts("Supercollider show signature"))
            kset("i", "<C-s>", function()
                signature.show()
            end, make_opts("Supercollider show signature"))

            -- Language calls
            local sclang = require("scnvim.sclang")
            kset({ "i", "n", "x" }, "<F1>", function()
                sclang.send("s.boot", true)
            end, make_opts("Supercollider server boot"))
            kset({ "i", "n", "x" }, "<F12>", function()
                sclang.hard_stop()
            end, make_opts("Supercollider hard stop"))
            kset("n", "<leader>st", function()
                sclang.start() -- Same as SCNvimStart
                sclang.poll_server_status()
            end, make_opts("Supercollider s[t]art sclang"))
            kset("n", "<leader>sp", function()
                sclang.stop() -- Same as SCNvimStop
            end, make_opts("Supercollider sto[p] sclang"))
        end,
    })
end

return M
