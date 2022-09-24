local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- package manager
	use 'wbthomason/packer.nvim'

	-- file exploration
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} },
	}

	-- theme
	use {
		'folke/tokyonight.nvim',
		config = function() require('config/theme') end,
	}

	-- syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = function() require('config/treesitter') end,
	}

	-- statusline and tabline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require('config/lualine') end,
	}

	-- comment toggler
	use {
		'numToStr/Comment.nvim',
		config = function() require('config/comment') end,
	}

	-- git integration
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('config/git') end,
	}

	use {
		'sindrets/diffview.nvim',
		requires = 'nvim-lua/plenary.nvim',
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
