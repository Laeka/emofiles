local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit insert mode with jk
map('i', 'jk', '<ESC>')

-- Move selected lines up/down in visual mode
map('x', '<S-j>', ":move '>+1<CR>gv-gv")
map('x', '<S-k>', ":move '<-2<CR>gv-gv")
map('n', '<S-j>', ":move '>+1<CR>gv-gv")
map('n', '<S-k>', ":move '<-2<CR>gv-gv")

map('n', '<C-s>', '<cmd>vsplit<cr>', { desc = 'New horizontal window' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
