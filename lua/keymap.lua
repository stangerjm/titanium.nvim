local function map(args)
  local key = args.key or nil
  local cmd = args.cmd or nil
  local mode = args.mode or 'n'
  local options = args.options or { noremap = true }
  vim.api.nvim_set_keymap(mode, key, cmd, options)
end

vim.g.mapleader = ' '
map{ key = '<Space>', cmd = '', options = {} }
map{ mode = 'v', key = '<Space>', cmd = '', options = {} }

-- Copy/paste helpers
map{ key = '<leader>y', cmd = '"*y' }
map{ mode = 'v', key = '<leader>y', cmd = '"*y' }
map{ key = '<leader>p', cmd = '"*p' }
map{ mode = 'v', key = '<leader>p', cmd = '"*p' }

-- Telescope keybindings
map{ key = '<leader>fg', cmd = '<cmd>Telescope live_grep<cr>' }
map{ key = '<leader>fb', cmd = '<cmd>Telescope buffers<cr>' }
map{ key = '<C-p>', cmd = '<cmd>Telescope find_files<cr>' }

-- Map the ',' key to a command that clears the previous search
map{ mode = '', key = ',', cmd = ':let @/=""<CR>' }
