return {
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        config = function()
            -- VimTeX configuration goes here, e.g.
            -- vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_imaps_enabled = 0
            vim.g.vimtex_quickfix_open_on_warning = 0
            vim.g.vimtex_fold_enabled = 1
            -- vim.g.vimtex_view_general_viewer = 'okular'
            -- vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
            vim.g.vimtex_view_method = 'zathura'
        end,
    },
}
