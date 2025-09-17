return {
  {
    'preservim/nerdtree',

    dependencies = { 'Xuyuanp/nerdtree-git-plugin' },

    config = function()
      vim.g.NERDTreeWinSize=50

      nmap('<leader>N', ':NERDTreeFind<cr>')
    end,
  },
}
