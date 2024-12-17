-- Set leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Let Vim know I have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ All other options ]]
require("config.options")

-- [[ Custom Keymaps ]]
require("config.keymaps")

-- [[ Autocommands ]]
require("config.autocmds")

-- [[ Install and configure `lazy.nvim` plugin manager ]]
require("config.lazy")
