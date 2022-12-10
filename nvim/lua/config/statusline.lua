require('lualine').setup{
  options = {
    icons_enabled = false,
    theme = "onedark",
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diagnostics', },
    lualine_c = { { 'filename', path = 1 }, },
    lualine_x = { 'filetype' },
    lualine_y = {  },
    lualine_z = {  },
  },
}
