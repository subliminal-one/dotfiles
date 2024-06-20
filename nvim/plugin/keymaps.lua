local set = vim.keymap.set
local opts = { silent = true, nowait = true }
local telescope = require("telescope.builtin")
local utils = require("config.utils")

vim.keymap.del("n", "grr")

set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
set("x", "p", '"_dP')

set("n", "<c-h>", "<c-w>h", opts)
set("n", "<c-l>", "<c-w>l", opts)
set("n", "<c-j>", "<c-w>j", opts)
set("n", "<c-k>", "<c-w>k", opts)

set("n", "<space>e", vim.diagnostic.open_float, opts)
set("n", "<space>q", vim.diagnostic.setloclist, opts)

set("n", "<Tab>", function() vim.cmd("tabnext") end, opts)
set("n", "<S-Tab>", function() vim.cmd("tabprev") end, opts)

-- helpers

local function project_files()
  local dir = utils.find_project_dir()
  telescope.find_files({ cwd = dir })
end

local function project_buffers()
  local dir = utils.find_project_dir()
  telescope.buffers({ cwd = dir, sort_mru = true })
end

local function search_buffer()
  telescope.current_buffer_fuzzy_find({
    sorting_strategy = "ascending",
    winblend = 10,
    previewer = false,
    layout_config = { width = 0.5, height = 0.8 },
  })
end

local function format()
  local result = require("conform").format({ async = false, lsp_fallback = true })

  if result == true then
    vim.cmd.write()
  end
end

-- plugins

---- Telescope
vim.keymap.set("n", "<leader><leader>w", project_files)
vim.keymap.set("n", "<leader><leader>b", project_buffers)
vim.keymap.set("n", "<leader>w", function() telescope.find_files() end)
vim.keymap.set("n", "<leader>b", function() telescope.buffers({ sort_mru = true }) end)
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope<CR>")
vim.keymap.set("n", "<leader>sl", function() telescope.find_files({ cwd = "%:h" }) end)
vim.keymap.set("n", "<leader>so", function() telescope.oldfiles() end)
vim.keymap.set("n", "<leader>sd", function() telescope.diagnostics() end)
vim.keymap.set("n", "<leader>s.", function() telescope.find_files({ cwd = "~/.dotfiles" }) end)
vim.keymap.set("n", "<leader>/", search_buffer)

---- conform
set("n", "<leader>ff", format)

---- oil
set("n", "-", "<cmd>Oil<cr>")

---- zen mode
set("n", "<leader>z", function() require("zen-mode").toggle() end)

---- nvim-tree
set("n", "\\", vim.cmd.NvimTreeFindFileToggle)

