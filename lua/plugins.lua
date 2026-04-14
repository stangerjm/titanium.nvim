return require('lazy').setup({
	-- File exploration
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  'debugloop/telescope-undo.nvim',
  {
    'nvim-telescope/telescope.nvim',
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
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter').setup {}
			vim.api.nvim_create_autocmd('FileType', {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},

	-- Statusline and tabline
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		init = function() require('config/lualine') end,
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
	-- Test runner
  {
    'vim-test/vim-test',
    init = function () require('config/test-runner') end,
  },
  -- Completion
  {
    'saghen/blink.cmp',
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-c>'] = { 'show' },
      },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline' },
      },
      fuzzy = { implementation = 'prefer_rust' },
      cmdline = { completion = { menu = { auto_show = true } } },
    },
  },
  -- AI agent integration
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "franco-ruggeri/codecompanion-spinner.nvim",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      interactions = {
        chat = {
          adapter = "kiro",
        },
      },
      extensions = {
        spinner = {},
        history = {
          enabled = true,
          opts = {
            auto_save = true,
            auto_generate_title = false,
            picker = "telescope",
          },
        },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { 'markdown', 'codecompanion' },
    },
  }
})
