-- I apparently can't have it any other way.

vim.g.gruvbox_italic = 0

return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
    },
  },
  { "cocopon/iceberg.vim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
