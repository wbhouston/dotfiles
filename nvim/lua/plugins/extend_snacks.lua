return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>tt",
      function()
        Snacks.picker.grep({
          prompt = " ",
          search = "^\\s*- \\[ \\]",
          regex = true,
          live = false,
        })
      end,
      desc = "Show incomplete todo items",
    },
  },
}
