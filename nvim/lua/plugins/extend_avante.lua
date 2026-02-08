return {
  "yetone/avante.nvim",
  opts = {
    behavior = {
      auto_approve_tool_permissions = false,
    },
    providers = {
      copilot = {
        model = "gpt-4.1",
      },
    },
    windows = {
      ask = {
        start_insert = false,
      },
    },
  },
}
