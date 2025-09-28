return {
  'catppuccin/nvim',
  name = 'catppuccin', -- Nombre para identificarlo
  lazy = false, -- Cargar al inicio
  priority = 1000, -- Asegurarse de que se cargue primero
  config = function()
    --@diagnostic disable-next-line missing-fields
    require('catppuccin').setup {
      flavour = 'macchiato',
      transparent_background = true,
      float = {
        transparent = false,
        solid = true,
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
