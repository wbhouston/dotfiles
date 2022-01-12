vim.cmd([[
" Conquer of Completion
let g:coc_global_extensions = [
  \ 'coc-solargraph',
\ ]

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

]])
