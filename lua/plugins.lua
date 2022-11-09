local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'

	-- File exploration
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function() require('config/telescope') end,
    },
  }

	-- Theme
	use {
		'folke/tokyonight.nvim',
		config = function() require('config/theme') end,
	}

	-- Syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = function() require('config/treesitter') end,
	}

	-- Statusline and tabline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function() require('config/lualine') end,
	}

	-- Comment toggler
	use {
		'numToStr/Comment.nvim',
		config = function() require('config/comment') end,
	}

	-- Git integration
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('config/git') end,
	}

	use {
		'sindrets/diffview.nvim',
		requires = {
			{ 'kyazdani42/nvim-web-devicons' },
			{ 'nvim-lua/plenary.nvim' },
		},
	}

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		config = function() require('config/lsp') end,
	}

	-- Completion
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'L3MON4D3/LuaSnip' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'onsails/lspkind.nvim' },
		},
		config = function() require('config/completion') end,
	}

	-- Test runner
  use {
    'vim-test/vim-test',
    config = function () require('config/test-runner') end,
  }

  -- Floating terminal
  use {
    'akinsho/toggleterm.nvim',
    config = function () require('config/terminal') end
  }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
