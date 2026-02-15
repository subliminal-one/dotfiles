local utils = require("config.utils")
local opts = { silent = true, nowait = true }

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("x", "p", '"_dP')

vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)

vim.keymap.set("n", "<c-Left>", "<c-w>h", opts)
vim.keymap.set("n", "<c-Right>", "<c-w>l", opts)
vim.keymap.set("n", "<c-Down>", "<c-w>j", opts)
vim.keymap.set("n", "<c-Up>", "<c-w>k", opts)

vim.keymap.set("n", "<A-Left>", "10<c-w><", opts)
vim.keymap.set("n", "<A-Right>", "10<c-w>>", opts)
vim.keymap.set("n", "<A-Down>", "10<c-w>-", opts)
vim.keymap.set("n", "<A-Up>", "10<c-w>+", opts)


vim.keymap.set("n", "<Tab>", function()
  vim.cmd("tabnext")
end, opts)

vim.keymap.set("n", "<S-Tab>", function()
  vim.cmd("tabprev")
end, opts)

local findLocalFiles = function()
  Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
end

local findDotFiles = function()
  Snacks.picker.files({ cwd = vim.fn.expand("$HOME/.dotfiles") })
end

local findHiddenFiles = function()
  Snacks.picker.files({ ignored = true, hidden = true })
end

local findLspSymbols = function()
  Snacks.picker.lsp_symbols({
    filter = {
      default = {
        -- "Class",
        -- "Constructor",
        "Constant",
        -- "Enum",
        -- "Field",
        "Function",
        -- "Interface",
        "Method",
        -- "Module",
        -- "Namespace",
        "Package",
        -- "Property",
        -- "Struct",
        -- "Trait",
      },
    },
  })
end

require("which-key").add({
  -- general
  { "\\", vim.cmd.NvimTreeFindFileToggle, desc = "File Tree" },
  { "<leader>e", vim.diagnostic.open_float, desc = "Diagnostic info"},
  { "<leader>'f", utils.formatFile, mode = { "n", "v" }, desc = "Format file" },
  { "<leader>yrp", utils.yankRelativePath, mode = { "n" }, desc = "Yank relative file path", },

  -- workspace
  {
    mode = { "n" },
    { "<leader>w", function() Snacks.picker.files() end, desc = "Files", },
    { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers", },
    { "<leader><leader>w", utils.findProjectFile, desc = "Project files" },
    { "<leader><leader>b", utils.findProjectBuffer, desc = "Project buffers" },
  },

  -- snacks
  {
    mode = { "n" },
    { "<leader>fp", function() Snacks.picker() end, desc = "Snacks Picker", },
    { "<leader>f.", findDotFiles, desc = "Dotfiles" },
    { "<leader>fl", findLocalFiles, desc = "Local files" },
    { "<leader>fs", findLspSymbols, desc = "LSP symbols" },
    { "<leader>fa", findHiddenFiles, desc = "Hidden files" },
    { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer diagnostics" },
    { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent files", },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log", },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff", },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status", },
    { "<leader>gf", function() Snacks.picker.git_files() end, desc = "Find Git Files", },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Find Git Branch", },
    { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "LSP References", },
  },
})
