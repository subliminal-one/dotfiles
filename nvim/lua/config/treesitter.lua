local treesitter = require('nvim-treesitter.configs');

treesitter.setup({
  ignore_install = { "swift", "angular", "godot_resource" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
});

-- local php_folds = [[
--   [
--     (comment)
--     (method_declaration)
--     (array_creation_expression)
--     (anonymous_function_creation_expression)
--   ] @fold
-- ]]
--
-- vim.treesitter.set_query('php', 'folds', php_folds)
