-- turn off treesitter indent because it is bad with Ruby and Slim

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    indent = { enable = false },
  },
}
