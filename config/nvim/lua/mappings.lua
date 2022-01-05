function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

vim.g.mapleader = ' '
nmap('<leader>n', ':noh<cr>')
nmap('<c-j>', '<c-w>j')
nmap('<c-k>', '<c-w>k')
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
nmap('<c-p>', ':Telescope find_files<cr>')
nmap('<leader><c-p>', ':Telescope live_grep<cr>')
-- nmap('', '')
