local opts = { silent = true, nowait = true }
local telescope = require("telescope.builtin")
local utils = require("config.utils")

vim.keymap.del("n", "grr")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("x", "p", '"_dP')

vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)

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
vim.keymap.set("n", "<leader>fp", project_files)
vim.keymap.set("n", "<leader>fo", telescope.oldfiles)
vim.keymap.set("n", "<leader>fg", telescope.git_status)

vim.keymap.set("n", "<leader>fw", telescope.find_files)
vim.keymap.set("n", "<leader>fbl", telescope.current_buffer_fuzzy_find)

vim.keymap.set("n", "<leader>fl", function() telescope.find_files({ cwd = vim.fn.expand("%:p:h") }) end)
vim.keymap.set("n", "<leader>f.", function() telescope.find_files({ cwd = "~/.dotfiles" }) end)

vim.keymap.set("n", "<leader>fa", function()
  telescope.find_files({
    find_command = { "fd", "--hidden", "--no-ignore", "--max-depth", "3" },
  })
end)

---- buffers
vim.keymap.set("n", "<leader>bp", project_buffers)
vim.keymap.set("n", "<leader>ba", function() telescope.buffers() end)
vim.keymap.set("n", "<leader>bl", function() telescope.buffers({ cwd = vim.fn.expand("%:p:h") }) end)

---- misc
vim.keymap.set("n", "<leader>fs", telescope.lsp_document_symbols)

--- gitsigns
vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns<CR>")

--- conform
vim.keymap.set("n", "<leader>F", format)

--- oil
vim.keymap.set("n", "-", "<cmd>Oil<cr>")

--- zen mode
vim.keymap.set("n", "<leader>z", function() require("zen-mode").toggle() end)

--- nvim-tree
vim.keymap.set("n", "\\", vim.cmd.NvimTreeFindFileToggle)

