-- [[ Custom keymaps ]]

-- Easier file saving
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- Close (kill) current buffer
vim.keymap.set("n", "<leader>k", "<cmd>bdelete<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open quickfix list
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open [Q]uickfix list" })

-- Mappings for Neovim's terminal buffer
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>ts", "<cmd>sp<CR><cmd>term<CR>", {desc = "Open Terminal in horizontal split"})
vim.keymap.set("n", "<leader>tv", "<cmd>vsp<CR><cmd>term<CR>", {desc = "Open Terminal in vertical split"})

-- Key bindings to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Use underscore instead of comma to repeat character search in the opposite direction:
vim.keymap.set("n", "_", ",")
