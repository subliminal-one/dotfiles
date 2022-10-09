require('onedark').setup{
  style = 'warm',
  code_style = {
    comments = 'none',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  highlights = {
    TelescopePromptBorder = { fg = '$grey' },
    TelescopeResultsBorder = { fg = '$grey' },
  },
}
vim.cmd('colorscheme onedark')

--[[ vim.g.everforest_background = 'hard'; ]]
--[[ vim.cmd('colorscheme everforest') ]]
