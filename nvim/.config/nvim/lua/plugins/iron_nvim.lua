-- Interactive REPLs over Neovim
-- Send lines of code from Neovim to the appropriate interpreter in Neovim's terminal
return {
    {
        "Vigemus/iron.nvim",
        ft = { "python", "sh", "r", "quarto" },
        config = function()
            local iron = require("iron.core")
            local view = require("iron.view")
            local fts = require("iron.fts")
            iron.setup({
                config = {
                    -- Whether a repl should be discarded or not
                    scratch_repl = true,
                    -- Your repl definitions come here
                    repl_definition = {
                        sh = {
                            -- Can be a table or a function that
                            -- returns a table (see below)
                            command = { "bash" },
                        },
                        -- python = fts.python.ipython,
                        python = {
                            command = function()
                                local ipythonAvailable = vim.fn.executable("ipython") == 1
                                local binary = ipythonAvailable and "ipython" or "python3"
                                return { binary }
                            end,
                        },
                    },
                    -- How the repl window will be displayed
                    -- See below for more information
                    repl_open_cmd = view.split.vertical.botright(0.4)
                },
                -- Iron doesn't set keymaps by default anymore.
                -- You can set them here or manually add keymaps to the functions in iron.core
                keymaps = {
                    send_file = "<localleader>sf",
                    send_line = "<localleader>ss",
                    visual_send = "<localleader>ss",
                    send_paragraph = "<localleader>sp",
                    send_until_cursor = "<localleader>su",
                    send_motion = "<localleader>sm",
                    exit = "<localleader>rq",
                },
                ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
            })
            -- Iron also has a list of commands, see :h iron-commands for all available commands
            vim.keymap.set('n', '<localleader>rs', '<cmd>IronRepl<cr>')
            vim.keymap.set('n', '<localleader>rr', '<cmd>IronRestart<cr>')
            vim.keymap.set('n', '<localleader>rf', '<cmd>IronFocus<cr>')
            vim.keymap.set('n', '<localleader>rh', '<cmd>IronHide<cr>')
        end,
    },
}
