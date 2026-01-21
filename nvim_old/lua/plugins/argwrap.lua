return {
  {
    'FooSoft/vim-argwrap',
    config = function ()
      vim.g.argwrap_padded_braces = '{'
      vim.g.argwrap_tail_comma = 1

      nmap('<Leader>aw', ':ArgWrap<cr>')
    end,
  },
}
