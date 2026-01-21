vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = " ╎", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.o.breakindent = false
vim.o.colorcolumn = "+1,+5"
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.mouse = ""
vim.o.scrolloff = 5
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.tabstop = 2
vim.o.termguicolors = false
vim.o.textwidth = 80
vim.o.title = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.smartindent = false

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.cmd([[
hi DiagnosticInfo ctermfg=239 ctermbg=109 guifg=#504945 guibg=#83a598
hi DiagnosticError ctermfg=167 ctermbg=235 gui=bold,reverse guifg=#fb4934 guibg=bg
]])

vim.cmd([[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.diagnostic.config({ virtual_text = false })

vim.cmd([[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]])

-- from https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
