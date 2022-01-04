vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Plugins setup
call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'kchmck/vim-coffee-script'
  Plug 'https://github.com/tpope/vim-dispatch'
  Plug 'https://github.com/tpope/vim-rails'
  Plug 'https://github.com/tpope/vim-endwise'
  Plug 'https://github.com/FooSoft/vim-argwrap'
  Plug 'slim-template/vim-slim'
  Plug 'flazz/vim-colorschemes'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

colorscheme gruvbox

" General Formatting
set backspace=2
set ruler
set textwidth=80
set wrap
set colorcolumn=+1,+5
set number
set numberwidth=5
set listchars=tab:▶\ ,trail:·,nbsp:·,eol:¬
set nolist
set relativenumber
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set hlsearch

" Conquer of Completion
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-solargraph',
\ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ s:check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Lemme use % for def/end
runtime macros/matchit.vim

augroup TrailingSpaces
  autocmd!
  autocmd BufWritePre * :call s:StripTrailingWhitespaces()
augroup END

" Strip trailing whitespace taken from Terry's vimrc
function! s:StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e             " Remove end of line whitespace
    %s/\($\n\s*\)\+\%$//e   " Remove end of file whitespace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" open blank session on enter
" VimEnter is nested so that bufenter/whatever is called for the notes
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * nested call OpenWorkSession()

fun OpenWorkSession()
  if argc() == 0 && !exists('s:std_in')
    tabedit ~/Notes/general_notes/nvim_notes.md
    MarkdownPreview
    call timer_start(1000, { tid -> execute('tabnext') })
  endif
endfun
]])
require('mappings')
require('argwrap')
