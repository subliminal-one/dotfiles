local treesitter = require('nvim-treesitter.configs');

treesitter.setup({
  ignore_install = { "swift", "angular", "godot_resource" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = false,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
});
