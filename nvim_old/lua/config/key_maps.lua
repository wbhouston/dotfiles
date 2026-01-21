function write_mappings_to_file()
  vim.cmd([[
    :redir! > ~/code/dotfiles/nvim_mappings.txt
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

-- Use c-m for page down
map('n', '<c-m>', '<c-d>')
map('n', '<c-n>', '<c-e>')
map('v', '<c-m>', '<c-d>')
map('v', '<c-n>', '<c-e>')

-- Close the current buffer and return to the previous buffer
nmap('<leader>q', ':bp<bar>sp<bar>bn<bar>bd<cr>')

-- Copy the current relative file path into the global register
-- Could be replaced by tpope's NERDTree alternative
nmap('<leader>cp', ':let @* = expand("%")<cr>')

-- Taken from https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
-- copy current file name (relative/absolute) to system clipboard
if vim.fn.has("mac") == 1 or vim.fn.has("gui_macvim") == 1 or vim.fn.has("gui_mac") == 1 then
  -- relative path  (src/foo.txt)
  --nnoremap <leader>cf :let @*=expand("%")<CR>
  nmap('<leader>cp', ':let @* = expand("%")<cr>')

  -- absolute path  (/something/src/foo.txt)
  -- nnoremap <leader>cF :let @*=expand("%:p")<CR>

  -- filename       (foo.txt)
  -- nnoremap <leader>ct :let @*=expand("%:t")<CR>

  -- directory name (/something/src)
  -- nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
else
  -- relative path (src/foo.txt)
  -- nnoremap <leader>cf :let @+=expand("%")<CR>
  nmap('<leader>cp', ':let @+ = expand("%")<cr>')

  -- absolute path (/something/src/foo.txt)
  -- nnoremap <leader>cF :let @+=expand("%:p")<CR>

  -- filename (foo.txt)
  -- nnoremap <leader>ct :let @+=expand("%:t")<CR>

  -- directory name (/something/src)
  -- nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
end
-- End https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim

-- delete current file
nmap('<leader>df', ':call delete(expand("%")) | bd!<cr>')

-- Missing the function here? This is supposed to delete quicklist items
vim.cmd([[
autocmd FileType qf map <buffer> dd :RemoveQFItem<c-r>
]])
