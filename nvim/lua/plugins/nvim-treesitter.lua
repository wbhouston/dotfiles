return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "OXY2DEV/markview.nvim" },
	build = ":TSUpdate",
	lazy = false,
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"ruby",
			"vim",
			"vimdoc",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby", "slim" },
		},
		indent = { enable = false, disable = { "ruby", "slim" } },
	},
	config = function()
		require("markview").setup({
				markdown = {
						headings = {
								heading_1 = { icon_hl = "@markup.link", icon = "[%d] " },
								heading_2 = { icon_hl = "@markup.link", icon = "[%d.%d] " },
								heading_3 = { icon_hl = "@markup.link", icon = "[%d.%d.%d] " }
						}
				}
		});
		require("markview.extras.checkboxes").setup();
		nmap("<leader>tt", ":Checkbox toggle<cr>");
	end,
}
