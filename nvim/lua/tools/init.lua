function PKMSettings()
  vim.o.columns = 200
  vim.o.linebreak = true

  vim.cmd([[NERDTree]])
  vim.cmd([[wincmd l]])
  vim.cmd([[AerialOpen]])
  vim.cmd([[wincmd h]])
  vim.cmd([[vi index.md]])
end

nmap("<leader>pkm", ":lua PKMSettings()<cr>", "Open PKM index with NERDTree and Aerial")
