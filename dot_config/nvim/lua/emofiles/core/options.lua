-- variables globales
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- options.lua
local opt = vim.opt

-- Esenciales
opt.termguicolors = true -- habilita colores de 24-bit
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end) -- portapapeles global del sistema

-- interfaz de usuario
opt.number = true -- muestra los numeros a la izquierda
opt.relativenumber = true -- los numeros a la izquierda seran relativos
opt.signcolumn = 'yes' -- mantiene la columna para errores o git.. siempre visible
opt.cursorline = true -- resalta la linea actual
opt.showmode = false -- oculta el estado en la parte inferior
opt.pumheight = 10 -- altura maxima del menu de autocompletado
opt.cmdheight = 1 -- altura de la linea de comandos
opt.fillchars:append { eob = ' ' } -- oculta los ~ de las lineas vacias

-- edicion de texto
opt.expandtab = true -- usa espacios en lugar de tabulaciones
opt.shiftwidth = 2 -- espacios para la indentacion
opt.tabstop = 2 -- ancho de una tabulacion
opt.smartcase = true -- busca mayus si escribes mayus
opt.ignorecase = true -- busca sin importar mayus/minus
opt.breakindent = true -- mantiene la identacion en las lineas envueltas
opt.inccommand = 'split' -- vista previa en una ventana dividida
opt.formatoptions:remove 'o' -- evita que inserte un comentario al presionar "o"

-- comportamiento del editor
opt.undofile = true -- Historial de undo persistente
opt.swapfile = true -- desactiva los archivos swap
opt.backup = false -- desactiva los archivos backup
opt.scrolloff = 10 -- mantiene 10 lineas de contexto alrededor del cursor
opt.splitright = true -- las nuevas ventanas verticales se abren a la derecha
opt.splitbelow = true -- las nuevas ventanas horizontales se abren abajo
opt.list = true -- muestra caracteres invisibles como espacios
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- igual que opt.list

-- rendimiento
opt.updatetime = 250 -- tiempo para escribir
opt.timeoutlen = 300 -- tiempo para un atajo
opt.shada = { "'10", '<0', 's10', 'h' } -- datos compartidos
