if vim.fn.executable('roslyn-language-server') == 1 then
  vim.lsp.enable('roslyn_ls')
else
  print("roslyn-language-server not found")
end
