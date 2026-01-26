return {
  {
    'FooSoft/vim-argwrap',
    config = function ()
      vim.g.argwrap_padded_braces = '{'
      vim.g.argwrap_tail_comma = 1
    end,
    keys = {
      {
        "<leader>aw",
        ":ArgWrap<cr>",
        desc = "ArgWrap",
      }
    }
  },
}
