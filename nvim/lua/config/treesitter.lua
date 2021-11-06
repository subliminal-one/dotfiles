local treesitter = require('nvim-treesitter.configs');

treesitter.setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = false,
  },
});

local php_folds = '[ (comment) (method_declaration) (array_creation_expression) ] @fold'
vim.treesitter.set_query('php', 'folds', php_folds)
