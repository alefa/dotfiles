-- [[ Custom keymaps ]]

-- Easier file saving
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- Close (kill) current buffer
vim.keymap.set("n", "<leader>k", "<cmd>bdelete<CR>")

-- List open buffers and select one
vim.keymap.set("n", "<leader>b", ":ls<CR>:b<Space>")

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

-- Move by display lines with j/k, but not if these are preceded by a count.
-- If they are preceded by a count, add these movements to the jumplist.
function LineMotion(dir)
    local count = vim.v.count1 > 1 and ("m'" .. vim.v.count1) or "g"
    vim.cmd("normal! " .. count .. dir)
end

vim.keymap.set('n', 'j', function() LineMotion("j") end, { silent = true })
vim.keymap.set('n', 'k', function() LineMotion("k") end, { silent = true })

-- Reload Neovim configuration
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")

-- Copy the whole file
vim.keymap.set("n", "<leader>y", "ggyG``")

-- Visually select last-pasted text
vim.keymap.set("n", "gV", "`[v`]")

-- Split line at cursor (the reverse operation to join lines [J])
-- Modified from Steve Losh's vimrc at https://bitbucket.org/sjl/dotfiles/src/cbbbc897e9b3/vim/vimrc
vim.keymap.set("n", "S", "i<CR><ESC>gk:silent! s/\v +$//<CR>gj^`.")

-- Easier completion
vim.keymap.set("i", "<C-o>", "<C-x><C-o>", { silent = true})
vim.keymap.set("i", "<C-f>", "<C-x><C-f>", { silent = true})
vim.keymap.set("i", "<C-l>", "<C-x><C-l>", { silent = true})

-- Insert current date
vim.keymap.set("i", "<C-d>", "<C-r>=strftime('%F')<CR>", { silent = true })

-- Set the working directory to the location of the current file
vim.keymap.set("n", "<leader>cd", ":cd %:h<CR>")
