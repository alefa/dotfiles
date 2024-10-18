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
vim.opt.listchars = { tab = '▸\\ ' }
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


-- Jump to the last position when reopening a file:
vim.api.nvim_create_augroup('last_pos', { clear = true })

vim.api.nvim_create_autocmd('BufReadPost', {
  group = 'last_pos',
  pattern = '*',
  callback = function()
    local last_pos = vim.fn.line([['"]])
    local last_line = vim.fn.line('$')

    if last_pos > 1 and last_pos <= last_line then
      vim.cmd('normal! g`"')
    end
  end,
})


-- Disable line numbers in Terminal mode
vim.api.nvim_create_augroup('term', { clear = true })

vim.api.nvim_create_autocmd('TermOpen', {
  group = 'term',
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

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


-- Completion settings:
-- Do not show completion options in a preview window
vim.opt.completeopt:remove { "preview" }
-- Show completion menu even if it has only one entry
vim.opt.completeopt:append { "menuone" }


-- [[ Filetype-specific settings ]]

-- Soft-wrap lines of certain file types and do not show a long-line indicator
-- for these files (everything that is prose, not code):
vim.api.nvim_create_augroup('prose_settings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'prose_settings',
  pattern = { 'tex', 'markdown', 'pandoc', 'dokuwiki', 'text', 'vimwiki', 'rmd', 'rnoweb' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.colorcolumn = ""
  end,
})

-- Set filetype of files with *.conf extension to conf(iguration)
-- with # as comment string:
vim.api.nvim_create_augroup('config', { clear = true })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'config',
  pattern = '*.conf',
  callback = function()
    vim.bo.filetype = 'conf'
  end,
})

-- Indentation rules for Python files
vim.api.nvim_create_augroup('python', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'python',
  pattern = { 'python' },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Settings for quickfix window:
vim.api.nvim_create_augroup('quickfix', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'quickfix',
  pattern = { 'qf' },
  callback = function()
    vim.opt_local.colorcolumn = false
  end,
})
