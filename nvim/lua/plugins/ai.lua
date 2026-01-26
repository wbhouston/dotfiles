-- I tried the LazyExtra for copilot chat and couldn't get it to work (on 2026-01-23).

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
  },
}
