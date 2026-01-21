return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
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
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {}
    },
  },
}
