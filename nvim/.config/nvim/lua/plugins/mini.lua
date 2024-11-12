return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Simple statusline
      local statusline = require 'mini.statusline'
      -- Use Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }
      -- Set the section for cursor location to LINE:COLUMN
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Autopairs
      require('mini.pairs').setup()

      -- Buffer/tab line
      require('mini.tabline').setup()

      -- File explorer
      require('mini.files').setup()
      vim.keymap.set('n', '<leader>f', ':lua MiniFiles.open()<CR>')

      -- Keep window open when closing buffers
      require('mini.bufremove').setup()

    end,
  },
}
