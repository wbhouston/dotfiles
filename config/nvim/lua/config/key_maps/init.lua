function write_mappings_to_file()
  vim.cmd([[
    :redir! > ~/Dotfiles/nvim_mappings.txt
    :silent verbose map
    :redir END
  ]])
end

-- Remove search highlights
nmap('<leader>n', ':noh<cr>')

-- Move windows with ctrl-<direction>
-- Prepended with c-slosh / c-n to get out of terminal mode
nmap('<c-j>', '<c-\\><c-n><c-w>j')
nmap('<c-k>', '<c-\\><c-n><c-w>k')
nmap('<c-h>', '<c-\\><c-n><c-w>h')
nmap('<c-l>', '<c-\\><c-n><c-w>l')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')

-- Close the current buffer and return to the previous buffer
nmap('<leader>q', ':bp<bar>sp<bar>bn<bar>bd<cr>')

-- Copy the current relative file path into the global register
-- Could be replaced by tpope's NERDTree alternative
nmap('<leader>cp', ':let @* = expand("%")<cr>')

-- Missing the function here? This is supposed to delete quicklist items
vim.cmd([[
autocmd FileType qf map <buffer> dd :RemoveQFItem<c-r>
]])
