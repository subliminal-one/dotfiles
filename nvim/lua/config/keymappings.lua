vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('x', "p", "\"_dP");

local file_exists = function(file)
  local fd = io.open(file, "r");
  return fd ~= nil and io.close(fd);
end

local is_project = function(dir)
  local files = {
    dir .. '/' .. 'package.json',
    dir .. '/' .. 'composer.json',
  };

  for _, file in pairs(files) do
    if file_exists(file) then
      return true
    end
  end

  return false
end

local builtin = require('telescope.builtin')

local mono_local_files = function()
  local cwd = vim.fn.getcwd();
  local buf_cwd = vim.fn.expand('%:p:h');
  local _, y = string.find(buf_cwd, cwd, 1, true);
  local parts = string.sub(buf_cwd, y + 1)

  local bits = { cwd }
  local path = ""
  for bit in string.gmatch(parts, "[^/]+") do
    path = path .. "/" .. bit;
    local entry = cwd .. path;
    table.insert(bits, entry);
  end

  local length = #bits;

  for x = length, 1, -1 do
    local dir = bits[x]

    if (is_project(dir)) then
      builtin.find_files({ cwd = dir })
      return
    end
  end

  builtin.find_files()
end

local mono_local_buffers = function()
  local cwd = vim.fn.getcwd();
  local buf_cwd = vim.fn.expand('%:p:h');
  local _, y = string.find(buf_cwd, cwd, 1, true);
  local parts = string.sub(buf_cwd, y + 1)

  local bits = { cwd }
  local path = ""
  for bit in string.gmatch(parts, "[^/]+") do
    path = path .. "/" .. bit;
    local entry = cwd .. path;
    table.insert(bits, entry);
  end

  local length = #bits;

  for x = length, 1, -1 do
    local dir = bits[x]

    if (is_project(dir)) then
      builtin.buffers({ cwd = dir })
      return
    end
  end

  builtin.buffers()
end

local opts = { silent = true, nowait = true }

vim.keymap.set('n', '<leader>t', "<cmd> Telescope<CR>", opts);

vim.keymap.set('n', '<leader>p', function() builtin.find_files() end, opts)
vim.keymap.set('n', '<leader>P', mono_local_files, opts);

vim.keymap.set('n', '<leader>b', function() builtin.buffers() end, opts)
vim.keymap.set('n', '<leader>B', mono_local_buffers, opts)

vim.keymap.set('n', '<leader>fr', function() builtin.live_grep() end)
vim.keymap.set('n', '<leader>fdl', function() builtin.find_files({ cwd = '%:h' }) end)
vim.keymap.set('n', '<leader>fdd', function() builtin.diagnostics() end)
vim.keymap.set('n', '<leader>fds', function() builtin.lsp_document_symbols() end)

vim.keymap.set('n', '<leader>F', function()
  require('conform').format({ async = true, lsp_fallback = true, bufnr = 0 })
end)

vim.keymap.set('n', '<leader>f.', function() builtin.find_files({ cwd = '~/.dotfiles' }) end)

vim.keymap.set('n', '\\', vim.cmd.NvimTreeFindFileToggle, opts);

vim.keymap.set('n', '<leader>gb', vim.cmd.GitMessenger, opts);

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.set('n', '<Tab>', function() vim.cmd('tabnext') end);
vim.keymap.set('n', '<S-Tab>', function() vim.cmd('tabprev') end);
