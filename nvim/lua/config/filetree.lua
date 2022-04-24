local neotree = require('neo-tree');

neotree.setup({
  close_if_last_window = false,
  enable_git_status = false,
  enable_diagnostics = true,
  respect_gitignore = false,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})

vim.keymap.set('n', '\\', ':Neotree toggle reveal<CR>');
