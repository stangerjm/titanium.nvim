vim.cmd[[
  set guicursor=
  augroup Shape autocmd! autocmd VimLeave * set guicursor=a:ver90 augroup END
]]

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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

-- disable line wrap
vim.wo.wrap = false
vim.wo.linebreak = false
vim.wo.list = false

-- disable mouse
vim.opt.mouse = ""

-- Add comment support for unknown files
vim.cmd[[
  autocmd FileType sh setlocal commentstring=#\ %s
]]
