-- Support for Quarto documents
return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { 'quarto' },
    dev = false,
    opts = {
            codeRunner = {
                enabled = true,
                default_method = "iron", -- "molten", "slime", "iron" or <function>
                ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
                -- Takes precedence over `default_method`
                never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
            },
        },
  },
}

