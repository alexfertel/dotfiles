require('plugins')

require('util')
require('options')

require('config.lsp')
require('config.compe')
require('config.treesitter')
require('config.appearance')
require('config.misc')

vim.o.tabstop = 8
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.clipboard = 'unnamedplus'
