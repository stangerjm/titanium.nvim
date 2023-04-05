return require('lazy').setup({
	-- File exploration
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function() require('config/telescope') end,
  },
	-- Theme
	{
		'folke/tokyonight.nvim',
		init = function() require('config/theme') end,
	},
	-- Syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		init = function() require('config/treesitter') end,
	},
	-- Statusline and tabline
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		init = function() require('config/lualine') end,
	},
	-- Comment toggler
	{
		'numToStr/Comment.nvim',
		init = function() require('config/comment') end,
	},
	-- Git integration
  'lewis6991/gitsigns.nvim',
  {
    'sindrets/diffview.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    init = function () require('config/git') end,
  },
	-- LSP
	{
		'neovim/nvim-lspconfig',
		init = function() require('config/lsp') end,
	},
	-- Completion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'onsails/lspkind.nvim',
		},
		init = function() require('config/completion') end,
	},
	-- Test runner
  {
    'vim-test/vim-test',
    init = function () require('config/test-runner') end,
  },
  -- Floating terminal
  {
    'akinsho/toggleterm.nvim',
    init = function () require('config/terminal') end
  },
})
