vim.cmd[[
  set guicursor=
  augroup Shape autocmd! autocmd VimLeave * set guicursor=a:ver90 augroup END
]]
