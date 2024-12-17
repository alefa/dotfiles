-- [[ Autocommands ]]

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
    vim.opt_local.colorcolumn = ""
  end,
})
