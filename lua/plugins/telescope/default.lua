return {
    cmd = "Telescope",
    keys = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        return {
            { "<leader>tf", builtin.find_files, desc = "[T]elescope find [f]ile" },
            { "<leader>tr", builtin.resume, desc = "[T]elescope [r]esume" },
            { "<leader>tb" },
            { "<leader>tl" },
            { "<leader>tg", telescope.extensions.live_grep_args.live_grep_args, desc = "[T]elescope live [g]rep" },
            { "<leader>th", builtin.help_tags, desc = "[T]elescope [h]elp tags" },
            { "<leader>tr", builtin.oldfiles, desc = "[T]elescope [r]ecent files" },
            { "<leader>tk", builtin.keymaps, desc = "[T]elescope [k]eymaps" },
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("live_grep_args")

        local builtin = require('telescope.builtin')
        local action_state = require('telescope.actions.state')
        local actions = require('telescope.actions')

        -- Add ability to delete selected buffers from the search results
        -- From here https://medium.com/@jogarcia/delete-buffers-on-telescope-21cc4cf61b63
        Buffer_searcher = function()
            builtin.buffers {
                sort_mru = true, -- Most recently used first
                ignore_current_buffer = true, -- Don't show current buffer in list
                show_all_buffers = false, -- Don't show hidden buffers
                attach_mappings = function(prompt_bufnr, map)
                    local refresh_buffer_searcher = function()
                        actions.close(prompt_bufnr)
                        vim.schedule(Buffer_searcher)
                    end

                    local delete_highlighted_buffer = function()
                        local selection = action_state.get_selected_entry()
                        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                        refresh_buffer_searcher()
                    end

                    local delete_selected_buffers = function()
                        local picker = action_state.get_current_picker(prompt_bufnr)
                        local selection = picker:get_multi_selection()
                        for _, entry in ipairs(selection) do
                            vim.api.nvim_buf_delete(entry.bufnr, { force = true })
                        end
                        refresh_buffer_searcher()
                    end

                    map('n', 'dd', delete_highlighted_buffer)
                    map('n', '<C-d>', delete_selected_buffers)
                    map('i', '<C-d>', delete_selected_buffers)

                    return true
                end
            }
        end

        vim.keymap.set('n', '<leader>tb', Buffer_searcher, { desc = "[T]elescope [b]uffers" })

        Backlink_searcher = function(text)
            builtin.live_grep({
                additional_args = {
                    "--hidden",
                    "--ignore-case",
                    "--fixed-strings",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--trim",
                    "-tmd", -- only for markdown files, should be moved to obsidian vim config
                    "--color=never",
                },
                default_text=text -- vim.fn.expand("%:t:r")
            })
        end

        vim.keymap.set('n', '<leader>tle', function() Backlink_searcher("[["..vim.fn.expand("%:t:r").."]]") end, { desc = "[T]elescope back[l]ink [e]xplicit" })
        vim.keymap.set('n', '<leader>tli', function() Backlink_searcher(vim.fn.expand("%:t:r")) end, { desc = "[T]elescope back[l]ink [i]mplicit" })
    end,
}
