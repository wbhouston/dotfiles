require('utils')
require('nvim_kickstart')
require('lsp.solargraph')
require('config.key_maps')
require('config.nvim_settings')
require('tools')
require('snippets')

-- HACK HACK HACK
-- Treesitter was reindenting with '.', and I couldn't figure out an lua-ish way
-- to remove it from indentkeys.
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/2566
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "ruby" },
  callback = function()
    vim.cmd[[setlocal indentkeys-=.]]
  end
})
