require('telescope').setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
      path = "%:p:h",
    },
  },
}

require('telescope').load_extension 'file_browser'
