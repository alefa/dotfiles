-- [[ Basic options ]]

-- Absolute line numbers
vim.opt.number = true
-- Relative line numbers
vim.opt.relativenumber = true
-- Don't wrap lines by default
vim.opt.wrap = false
-- If lines are wrapped, break them at white spaces
vim.opt.linebreak = true
-- Indent wrapped lines
vim.opt.breakindent = true
-- Show an indicator for long lines
vim.opt.colorcolumn = '100'
-- Show at least this number of lines above or below the cursor
vim.opt.scrolloff = 10
-- Show (partial) command in status line
vim.opt.showcmd = true
-- Show matching brackets
vim.opt.showmatch = true
-- Do case insensitive matching when searching
vim.opt.ignorecase = true
-- Do smart case matching when searching
vim.opt.smartcase = true
-- Automatically save before commands like :next and :make
vim.opt.autowrite = true
-- Hide buffers when they are abandoned
vim.opt.hidden = true
-- Replace all occurences of a pattern, not just the first
vim.opt.gdefault = true
-- Make tab completion case-insensitive
vim.opt.wildignorecase = true
-- Tab completion: complete to longest common string and show menu
vim.opt.wildmode = { longest = 'full' }
-- Use these characters to show invisible characters
vim.opt.listchars = { tab = '▸\\ ' , trail = '·'}
-- Horizontal splits below the current one (default is above)
vim.opt.splitbelow = true
-- Vertical splits to the right of the current one (default is left)
vim.opt.splitright = true
-- For security reasons, modeline is off by default in Debian and Ubuntu
vim.opt.modeline = true
-- Pause redrawing the screen when executing macros and functions
vim.opt.lazyredraw = true
-- Allow moving the cursor outside of the text in visual block mode
vim.opt.virtualedit = 'block'
-- Search path for :find and friends
vim.opt.path = { '.', '**' }
-- Enable mouse usage (all modes)
vim.opt.mouse = 'a'
-- Show effects of substitution while typing
vim.opt.inccommand = "nosplit"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Set python path
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

-- Ignored patterns when completing file names:
vim.opt.wildignore:append({ '*.o', '*.tar.gz', '*.synctex.gz', '*.aux', '*.fff', '*.fls', '*.ttt', '*.out', '*.bbl', '*.blg', '*.fdb_latexmk' })

-- Indentation rules:
-- Do not insert spaces for tabs
vim.opt.expandtab = true
-- Width of a tab character
vim.opt.tabstop = 4
-- Indentation width
vim.opt.shiftwidth = 4
-- Number of spaces a tab counts for in editing operations
vim.opt.softtabstop = 0
vim.opt.smartindent = true

-- Don't use backup and swap files:
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- vim.opt.default language for spell checking:
vim.opt.spelllang = "en_gb"

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fs.normalize('~/.nvim_undo')
vim.opt.undolevels = 1000
vim.opt.undoreload = 1000

-- Code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for code folding
vim.opt.foldcolumn = "0" -- Turn off foldcolumn
vim.opt.foldlevel = 99 -- Minimum foldlevel that will be closed by default
vim.opt.foldlevelstart = 99 -- Open files with all folds open
vim.opt.foldnestmax = 20 -- Maximum number of nested folds (20 is the maximum possible value)
vim.opt.foldtext = "" -- Don't modify the appearance of the first line of each fold

-- Completion settings:
-- Do not show completion options in a preview window
vim.opt.completeopt:remove { "preview" }
-- Show completion menu even if it has only one entry
vim.opt.completeopt:append { "menuone" }

-- Set filetype of .tex files to LaTeX:
vim.g.tex_flavor = "latex"
