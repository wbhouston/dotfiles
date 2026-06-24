return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        init_options = {
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      },
      snyk_ls = {
        init_options = {
          activateSnykCode = "true",
          trustedFolders = {
            "/Users/williamhouston/code/val-barcoder",
            "/Users/williamhouston/code/val-doc-storage",
          },
        },
      },
    },
  },
}
