local lsp = require('lspconfig')
local opts = { noremap=true, silent=true }

-- go to next error
vim.keymap.set('n', '<space>e', function()
	vim.diagnostic.goto_next()
	vim.diagnostic.open_float()
end, opts)

-- show all diagnostics
vim.keymap.set('n', '<space>E', vim.diagnostic.setloclist, opts)

local filetypes = {
	javascript = "eslint",
	typescript = "eslint",
	typescriptreact = "eslint",
}

local linters = {
	eslint = {
		sourceName = "eslint",
		command = "eslint_d",
		rootPatterns = {
			".eslintrc.js",
			"package.json",
			".git"
		},
		debounce = 100,
		args = {
			"--stdin",
			"--stdin-filename",
			"%filepath",
			"--format",
			"json"
		},
		parseJson = {
			errorsRoot = "[0].messages",
			line = "line",
			column = "column",
			endLine = "endLine",
			endColumn = "endColumn",
			message = "${message} [${ruleId}]",
			security = "severity"
		},
		securities = {[2] = "error", [1] = "warning"}
	}
}

-- congigure border around window
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮",  "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Typescript
lsp['tsserver'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}

-- Lua
lsp['sumneko_lua'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
}

-- Linters (ESLint)
lsp['diagnosticls'].setup{
	filetypes = vim.tbl_keys(filetypes),
	init_options = {
		filetypes = filetypes,
		linters = linters,
	},
}
