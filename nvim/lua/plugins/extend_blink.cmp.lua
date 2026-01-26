-- blink.cmp recommends turning off preselect with the "enter" config used by LazyVim
-- https://cmp.saghen.dev/configuration/keymap.html#enter

return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
    },
  },
}
