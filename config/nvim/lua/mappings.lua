vim.g.mapleader = ' '

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap('<leader>n', ':noh<cr>')
nmap('<c-j>', '<c-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-h>', '<C-w>h')
nmap('<C-l>', '<C-w>l')
nmap('<C-p>', ':Telescope find_files<cr>')
nmap('<leader><C-p>', ':Telescope live_grep<cr>')
-- nmap('', '')
