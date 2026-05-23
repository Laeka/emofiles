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

-- Mover líneas seleccionadas en Modo Visual
map('x', '<S-j>', ":move '>+1<CR>gv")
map('x', '<S-k>', ":move '<-2<CR>gv")

-- Mover la línea actual en Modo Normal
map('n', '<S-j>', ':m .+1<CR>')
map('n', '<S-k>', ':m .-2<CR>')

-- Moverse entre ventanas (splits) con Ctrl + h/j/k/l
map('n', '<C-j>', '<Cmd>wincmd j<CR>')
map('n', '<C-k>', '<Cmd>wincmd k<CR>')
map('n', '<C-h>', '<Cmd>wincmd h<CR>')
map('n', '<C-l>', '<Cmd>wincmd l<CR>')

map('n', '<C-s>', '<cmd>vsplit<cr>', { desc = 'Nueva ventana vertical' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Abre los errores y warnings' })

-- Ir al buffer anterior o siguiente
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Buffer anterior' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Buffer siguiente' })
