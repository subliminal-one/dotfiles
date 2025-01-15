local opts = { silent = true, nowait = true }
local telescope = require("telescope.builtin")
local utils = require("config.utils")


vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("x", "p", '"_dP')

vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)

vim.keymap.set("n", "<c-left>", "<c-w>h", opts)
vim.keymap.set("n", "<c-down>", "<c-w>j", opts)
vim.keymap.set("n", "<c-up>", "<c-w>k", opts)
vim.keymap.set("n", "<c-right>", "<c-w>l", opts)

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "<Tab>", function() vim.cmd("tabnext") end, opts)
vim.keymap.set("n", "<S-Tab>", function() vim.cmd("tabprev") end, opts)

-- helpers

local function project_files()
  local cwd = utils.find_project_dir()
  telescope.find_files({ cwd = cwd })
end

local function project_buffers()
  local cwd = utils.find_project_dir()
  telescope.buffers({ cwd = cwd })
end

local function format()
  local result = require("conform").format({ async = false, lsp_fallback = true })

  if result == true then
    vim.cmd.write()
  end
end

-- plugins

--- Telescope
vim.keymap.set("n", "<leader>t", "<cmd>Telescope<cr>")

---- files
vim.keymap.set("n", "<leader>w", telescope.find_files)
vim.keymap.set("n", "<leader><leader>w", project_files)

vim.keymap.set("n", "<leader>fo", telescope.oldfiles)
vim.keymap.set("n", "<leader>fg", telescope.git_status)

vim.keymap.set("n", "<leader>fbl", telescope.current_buffer_fuzzy_find)

vim.keymap.set("n", "<leader>f.", function() telescope.find_files({ cwd = "~/.dotfiles" }) end)
vim.keymap.set("n", "<leader>fl", function() telescope.find_files({ cwd = vim.fn.expand("%:p:h") }) end)

vim.keymap.set("n", "<leader>fa", function()
  telescope.find_files({
    find_command = {
      "fd",
      "--type", "file",
      "--hidden",
      "--no-ignore",
      "--exclude", "*.svg",
      "--exclude", "*.gif",
      "--exclude", "*.png",
      "--exclude", "*.jpg",
      "--exclude", "*.jpeg",
      "--exclude", "*.min.js",
      "--exclude", ".git/",
      "--exclude", "dist/",
      "--exclude", "vendor/",
      "--exclude", "wl-sdk-js/",
      "--exclude", "coverage/",
      "--exclude", "storage/",
      "--exclude", "node_modules/",
    },
  })
end)

---- buffers
vim.keymap.set("n", "<leader>b", function() telescope.buffers({ sort_mru = true, sort_last_used = true }) end)
vim.keymap.set("n", "<leader>B", function()
  telescope.buffers({
    sort_mru = true,
    sort_last_used = true,
    cwd = vim.fn.getcwd(),
  })
end)
vim.keymap.set("n", "<leader><leader>b", project_buffers)

---- misc
vim.keymap.set("n", "<leader>fs", telescope.lsp_document_symbols)

--- gitsigns
vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns<CR>")

--- conform
vim.keymap.set("n", "<leader>F", format)

--- nvim-tree
vim.keymap.set("n", "\\", vim.cmd.NvimTreeFindFileToggle)

