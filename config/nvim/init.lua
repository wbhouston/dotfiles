vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Plugins setup
call plug#begin('~/.vim/plugged')
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
  Plug 'dcampos/nvim-snippy'
  Plug 'honza/vim-snippets'
  Plug 'TamaMcGlinn/quickfixdd'
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
set runtimepath+='~/.vim/snippets'

" Lemme use % for def/end
runtime macros/matchit.vim

" Prevent LSP from opening a preview window
set completeopt=menuone,noinsert,noselect

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

fun OpenWorkSession()
  if argc() == 0 && !exists('s:std_in')
    terminal
    tabnew
    terminal
    vsp
    terminal
  endif
endfun
]])

-- mappings must come first to redefine the leader and define map functions
require('mappings')
require('tools')
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

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

require('snippy').setup({
    mappings = {
        is = {
            ['<tab>'] = 'expand_or_advance',
            ['<s-tab>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
})

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig').solargraph.setup(
  {
    on_attach = on_attach
  }
)
