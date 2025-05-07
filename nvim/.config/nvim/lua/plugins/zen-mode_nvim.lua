return {
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 1, -- shade of backdrop of Zen window, default 0.95
                width = 100, -- width of Zen window (lines), default 120
                height = 0.9, -- height of Zen window (proportion of total height), default 1
                options = {
                    signcolumn = "no", -- disable signcolumn
                    number = false, -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = false, -- disable cursorline
                    cursorcolumn = false, -- disable cursor column
                    foldcolumn = "0", -- disable fold column
                    list = false, -- disable whitespace characters
                },
            },
        }
    },
    vim.keymap.set('n', '<leader>zm', '<cmd>ZenMode<cr>')
}
