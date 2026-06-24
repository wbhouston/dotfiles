return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>tt",
      function()
        Snacks.picker.grep_buffers({
          prompt = " ",
          search = "^\\s*- \\[ \\]",
          regex = true,
          live = false,
        })
      end,
      desc = "Show incomplete todo items",
    },
    {
      "<leader>fm",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Move/Rename File",
    },
  },
}
