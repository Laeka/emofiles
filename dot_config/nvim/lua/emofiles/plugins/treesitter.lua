return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require 'nvim-treesitter'

    local parsers = {
      'lua',
      'luadoc',
      'typescript',
      'tsx',
      'dockerfile',
      'markdown',
      'markdown_inline',
    }

    for _, parser in ipairs(parsers) do
      ts.install(parser)
    end

    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
