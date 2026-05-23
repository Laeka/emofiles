-- resalta el texto despues de copiarlo
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('emofiles-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- reajusta ventanas al cambiar el tama;o de la terminal
vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Auto resize panes when terminal is resized',
  group = vim.api.nvim_create_augroup('emofiles-resize-splits', { clear = true }),
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})
