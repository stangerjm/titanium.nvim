local actions = require('diffview.actions')

require('gitsigns').setup {
	current_line_blame_opts = {
		delay = 300,
	}
}

require('diffview').setup {
  file_panel = {
    listing_style = 'list',
  },
  keymaps = {
    file_panel = {
      ['gf'] = actions.goto_file_tab,
    },
  },
}
