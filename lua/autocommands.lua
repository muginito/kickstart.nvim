--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'tex', 'plaintex' },
  callback = function()
    vim.keymap.set('i', '<C-A-m>', '\\[\\]<Left><Left>', { buffer = true })
    vim.keymap.set('i', '<C-A-l>', '$$<Left>', { buffer = true })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'tex', 'plaintex', 'markdown' },
  callback = function()
    vim.o.spell = true
  end,
})
