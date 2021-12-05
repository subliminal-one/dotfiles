-- vim.g.edge_style                     = 'neon'
-- vim.g.edge_show_eob                  = 1
-- vim.g.edge_enable_italic             = 1
-- vim.g.edge_menu_selection_background = 'purple'
-- vim.g.edge_diagnostic_text_highlight = 0
-- vim.g.edge_diagnostic_line_highlight = 0
-- vim.g.edge_diagnostic_virtual_text   = 'grey'

--vim.cmd('colorscheme edge')
require('onenord').setup({
  borders = true,
  italics = {
    comments = false,
    strings = false,
    keywords = false,
    functions = false,
    variables = false,
  },
  disable = {
    background = false,
    cursorline = false,
    eob_lines = false,
  },
});

vim.cmd('colorscheme onenord')
