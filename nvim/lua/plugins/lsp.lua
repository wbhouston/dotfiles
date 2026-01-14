return {
  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua_ls",
        "clangd",
        "ruby-lsp",

        -- Formatters
        "stylua",

        -- Linters
        "luacheck",
      },
    },
  },
}
