-- helper function for mapping keys
local function map(args)
  local key = args.key or nil
  local cmd = args.cmd or nil
  local mode = args.mode or 'n'
  local options = args.options or { noremap = true }
  vim.api.nvim_set_keymap(mode, key, cmd, options)
end

-- Map spacebar to leader
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
map{ key = '<leader>fb', cmd = '<cmd>Telescope file_browser<cr>' }
map{ key = '<C-p>', cmd = '<cmd>Telescope find_files<cr>' }

-- Map the ',' key to a command that clears the previous search
map{ mode = '', key = ',', cmd = ':let @/=""<CR>' }

-- Map <leader> + movement keys to change windows
map{ key = '<leader>l', cmd = '<C-w>l' }
map{ key = '<leader>k', cmd = '<C-w>k' }
map{ key = '<leader>j', cmd = '<C-w>j' }
map{ key = '<leader>h', cmd = '<C-w>h' }

-- Map <leader> + m + movement key to move a split directionally
map{ key = '<leader>ml', cmd = '<C-w>L' }
map{ key = '<leader>mk', cmd = '<C-w>K' }
map{ key = '<leader>mj', cmd = '<C-w>J' }
map{ key = '<leader>mh', cmd = '<C-w>H' }

-- Toggle comments
map{ key = '<leader>c', cmd = '<Plug>(comment_toggle_linewise)' }
map{ key = '<leader>cc', cmd = '<Plug>(comment_toggle_linewise_current)' }
map{ mode = 'x', key = '<leader>c', cmd = '<Plug>(comment_toggle_linewise_visual)' }

-- Git blame
map{ key = '<leader>b', cmd = ':Gitsigns toggle_current_line_blame<CR>' }

-- Git diff
map{ key = '<leader>d', cmd = ':DiffviewOpen<CR>' }
map{ key = '<leader>s', cmd = ':DiffviewToggleFiles<CR>' }

-- Quick close tab
map{ key = '<leader>q', cmd = ':tabclose<CR>' }

-- Quick zooming windows
map{ key = '<leader>z', cmd = '<C-w>|' }
map{ key = '<leader>o', cmd = '<C-w>=' }

-- Running tests
map{ key = '<leader>g', cmd = ':TestFile<CR>' }
map{ key = '<leader>n', cmd = ':TestNearest<CR>' }
map{ mode='t', key = '<C-o>', cmd = '<C-\\><C-n>' }

-- Open terminal
map{ key = '<leader>t', cmd = ':ToggleTerm<CR>' }

-- Undo
map{ key = '<leader>u', cmd = '<cmd>Telescope undo<CR>' }
