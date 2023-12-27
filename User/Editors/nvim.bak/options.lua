local g = vim.g
local opt = vim.o

-- Base Keybindings 
g.mapleader = " "
g.maplocalleader = " "

-- Indentation
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- set clipboard to use system clipboard
opt.clipboard = "unnamedplus"

-- use mouse
opt.mouse = "a"

-- nicer ui settings
opt.termguicolors = true
opt.cursorline = true
opt.number = true
opt.updatetime = 300

-- Miscellaneous quality of life
opt.smartcase = true
opt.ttimeoutlen = 5
opt.compatible = false
opt.autoread = true
opt.incsearch = true
opt.hidden = true
opt.shortmess = "atI"
