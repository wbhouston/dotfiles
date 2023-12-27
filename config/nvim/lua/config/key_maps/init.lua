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
-- Can I map these to terminal, too?
nmap('<c-j>', '<c-\\><c-n><c-w>j')
nmap('<c-k>', '<c-\\><c-n><c-w>k')
nmap('<c-h>', '<c-\\><c-n><c-w>h')
nmap('<c-l>', '<c-\\><c-n><c-w>l')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')

-- Telescope find_files for specific project directories
nmap(
  '<leader>sa',
  ":lua require('telescope.builtin').find_files({search_dirs = {'app', 'config/locales', 'config/routes.rb', 'src'}})<cr>",
  "[S]earch [A]pp Files"
)

nmap(
  '<leader>sc',
  ":lua require('telescope.builtin').find_files({search_dirs = {'app/controllers'}})<cr>",
  "[S]earch [C]ontrollers"
)

nmap(
  '<leader>ss',
  ":lua require('telescope.builtin').find_files({search_dirs = {'spec'}})<cr>",
  "[S]earch [S]pecs"
)

-- Close the current buffer and return to the previous buffer
nmap('<leader>q', ':bp<bar>sp<bar>bn<bar>bd<cr>')

-- Copy the current relative file path into the global register
-- Could be replaced by tpope's NERDTree alternative
nmap('<leader>cp', ':let @* = expand("%")<cr>')

-- Missing the function here? This is supposed to delete quicklist items
vim.cmd([[
autocmd FileType qf map <buffer> dd :RemoveQFItem<c-r>
]])
