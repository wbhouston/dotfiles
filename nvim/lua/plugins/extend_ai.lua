return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    adapters = {
      http = {
        ollamalocal = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://localhost:11434",
            },
            schema = {
              model = {
                default = "qwen3.8:latest",
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = "ollamalocal",
      },
    },
    log_level = "DEBUG",
  },
}
