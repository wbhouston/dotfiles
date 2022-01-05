vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Plugins setup
call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
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

" Lemme use % for def/end
runtime macros/matchit.vim

augroup TrailingSpaces
  autocmd!
  autocmd BufWritePre * :call StripTrailingWhitespaces()
augroup END

" Strip trailing whitespace taken from Terry's vimrc
function! StripTrailingWhitespaces()
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
    lcd ~/Notes
    call timer_start(1000, { tid -> execute('tabnext') })
  endif
endfun
]])

-- mappings must come first to redefine the leader and define map functions
require('mappings')

require('argwrap')
require('nerdtree')
require('plugins')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<c-h>"] = "which_key"
      },
    },
  },
  pickers = {
    live_grep = {
      only_sort_text = true,
    },
  },
}
