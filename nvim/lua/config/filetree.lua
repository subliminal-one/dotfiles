local neotree = require('neo-tree');

neotree.setup({
  close_if_last_window = false,
  enable_git_status = false,
  enable_diagnostics = false,
  respect_gitignore = false,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  --[[ default_component_configs = { ]]
  --[[   icon = { ]]
  --[[     folder_closed = "+", ]]
  --[[     folder_open = "-", ]]
  --[[     folder_empty = "~", ]]
  --[[   }, ]]
  --[[ }, ]]
})
