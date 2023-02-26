vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { silent = true, nowait = true }

--[[ vim.keymap.set('n', "<C-d>", '<C-d>zz'); ]]
--[[ vim.keymap.set('n', "<C-u>", '<C-u>zz'); ]]
vim.keymap.set('x', "p", "\"_dP");

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', vim.cmd.Telescope)
vim.keymap.set('n', '<leader>p', function() builtin.find_files({ previewer = false }) end);
vim.keymap.set('n', '<leader>b', function() builtin.buffers({ sort_mru = true, previewer = false }) end)
vim.keymap.set('n', '<leader>fg', function() builtin.git_status() end, opts)
vim.keymap.set('n', '<leader>fa', function() builtin.find_files({ hidden = true, no_ignore = true, previewer = false, }) end)
vim.keymap.set('n', '<leader>fl', function() builtin.find_files({ cwd = '%:h', previewer = false }) end)
vim.keymap.set('n', '<leader>fo', function() builtin.oldfiles() end)
vim.keymap.set('n', '<leader>fd', function() builtin.diagnostics() end)
vim.keymap.set('n', '<leader>fs', function() builtin.lsp_document_symbols() end)
vim.keymap.set('n', '<leader>fr', function() builtin.live_grep() end)
vim.keymap.set('n', '<leader>f.', function() builtin.find_files({ cwd = '~/.dotfiles' }) end)

-- File Tree
vim.keymap.set('n', '\\', vim.cmd.NvimTreeFindFileToggle, opts);

-- Git Blame
vim.keymap.set('n', '<leader>gb', vim.cmd.GitMessenger, opts);

-- Tabluar
vim.keymap.set('v', '<leader>a', ':Tab /', {})

-- Diagnostics
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Zenmode
vim.keymap.set('n', '<space>z', function() require('zen-mode').toggle() end)
