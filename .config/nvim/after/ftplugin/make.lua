if vim.fn.executable('make-ls') == 1 then
  vim.lsp.enable('make-ls')
else
  print("make-ls not found")
end
