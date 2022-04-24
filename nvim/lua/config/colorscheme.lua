-- vim.g.everforest_background = 'soft'
-- vim.g.everforest_enable_italic = 0
-- vim.cmd('colorscheme everforest')

require('onedark').setup({
  style = 'warm',
  code_style = {
    comments = 'none',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  -- colors = {
  --   fg = '#bcbfc4',
    -- grey = '#78797d',
  --   cyan = '#53a5b9',
  -- },
  highlights = {
  --   Folded = { fg = '$light_grey', bg = '$bg1' },
  --   TSConstructor = { fg = '$yellow', fmt = 'none' },
  --   TSType = { fg = '$orange' },
    TelescopePromptBorder = { fg = '$grey' },
    TelescopeResultsBorder = { fg = '$grey' },
  },
})
vim.cmd('colorscheme onedark')
