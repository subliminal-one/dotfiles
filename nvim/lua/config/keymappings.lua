vim.g.mapleader = ' '

local opts  = { silent = true, nowait = true }

-- Telescope
vim.keymap.set('n', '<leader>t', ':Telescope<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers sort_mru=true previewer=false<CR>', opts)
vim.keymap.set('n', '<leader>fp', ':Telescope find_files previewer=false<CR>', opts)
vim.keymap.set('n', '<leader>fg', ':Telescope git_status <CR>', opts)
vim.keymap.set('n', '<leader>fa', ':Telescope find_files hidden=true no_ignore=true previewer=false<CR>', opts)
vim.keymap.set('n', '<leader>fl', ':Telescope find_files cwd=%:h previewer=false<CR>', opts)
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles <CR>', opts)
vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics bufnr=0 <CR>', opts)
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', opts)
vim.keymap.set('n', '<leader>fr', ':Telescope live_grep <CR>', opts)
vim.keymap.set('n', '<leader>f.', ':Telescope find_files cwd=~/.dotfiles <CR>', opts)

-- File Tree
vim.keymap.set('n', '\\', ':Neotree toggle reveal<CR>', opts);

-- Git Blame
vim.keymap.set('n', '<leader>gb', '<Plug>(git-messenger)', opts);

-- Tabluar
vim.keymap.set('v', '<leader>a', ':Tab /', {})
