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

        -- Formatters
        "stylua",

        -- Linters
        "luacheck",
      },
    },
  },
}
