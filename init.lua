vim.cmd[[
  set guicursor=
  augroup Shape autocmd! autocmd VimLeave * set guicursor=a:ver90 augroup END
]]

require('plugins')
require('keymap')

-- Set tab to two spaces
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Use smartcase for searching (see :h smartcase)
vim.o.ignorecase = true
vim.o.smartcase = true

-- Show number lines
vim.o.number = true
vim.o.relativenumber = true

-- persistent undo
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
vim.o.undofile = true

-- Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.shiftround = true
vim.o.smarttab = true
