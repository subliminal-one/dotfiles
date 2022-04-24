local telescope = require('telescope')
local actions = require('telescope.actions');

telescope.setup{
  defaults = {
    file_ignore_patterns = {
      '/vendor',
      '/node_modules',
      '/storage/framework',
    },
    mappings = {
      i = {
        ["<C-["] = actions.close,
        ["<esc>"] = actions.close,
      },
      n = {
        ["<C-["] = actions.close,
        ["<esc>"] = actions.close,
      },
    },
    layout_config = {
      horizontal = {
        width = 0.75,
      },
    },
  },
}

local opts  = { silent = true }
vim.keymap.set('n', '<leader>p', ':Telescope git_files show_untracked=true previewer=false<CR>', opts)
vim.keymap.set('n', '<leader>l', ':Telescope find_files previewer=false<CR>', opts)
vim.keymap.set('n', '<leader>L', ':Telescope find_files cwd=%:h previewer=false<CR>', opts)
vim.keymap.set('n', '<leader>;', ':Telescope buffers sort_mru=true <CR>', opts)
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', opts)
vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics bufnr=0 <CR>', opts)
vim.keymap.set('n', '<leader>f.', ':Telescope find_files cwd=~/.dotfiles <CR>', opts)
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles <CR>', opts)
vim.keymap.set('n', '<leader>fgr', ':Telescope live_grep <CR>', opts)
vim.keymap.set('n', '<leader>fgs', ':Telescope git_status <CR>', opts)
vim.keymap.set('n', '<leader>ff', ':Telescope <CR>', opts)
vim.keymap.set('n', '<leader>fp', ':Telescope find_files cwd=~/.local/share/nvim/site/pack/packer/start <CR>', opts)
vim.keymap.set('n', '<leader>fgb', ':Telescope current_buffer_fuzzy_find <CR>', opts)
