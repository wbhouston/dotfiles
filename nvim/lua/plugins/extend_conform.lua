return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      ["markdownlint-cli2"] = {
        args = { "--fix", "$FILENAME" },
      },
    },
    formatters_by_ft = {
      markdown = { "markdownlint-cli2" },
    },
  },
}
