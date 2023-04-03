return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
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
        lualine_b = {
          {
            'filename',
            path = 1,
          },
        },
      },
      inactive_sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          },
        },
      },
      tabline = {},
      extensions = {}
    },
  },
}
