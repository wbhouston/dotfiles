vim.o.breakindent = false
vim.o.colorcolumn = '+1,+5'
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.mouse = false
vim.o.scrolloff = 5
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.tabstop = 2
vim.o.termguicolors = false
vim.o.textwidth = 80
vim.o.title = true
vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd[[
hi DiagnosticInfo ctermfg=239 ctermbg=109 guifg=#504945 guibg=#83a598
hi DiagnosticError ctermfg=167 ctermbg=235 gui=bold,reverse guifg=#fb4934 guibg=bg
]]

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.diagnostic.config({virtual_text = false})

  -- from https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
