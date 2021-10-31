local telescope = require('telescope')
local actions = require('telescope.actions');
local action_set = require("telescope.actions.set")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.75,
        width  = 0.75,
        preview_width = 0.45,
      },
    },
    mappings = {
      i = {
        ["<C-]>"] = actions.close,
        ["<esc>"] = actions.close,
      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
  },
})

local opts  = { noremap = true, silent = false }
local remap = vim.api.nvim_set_keymap

remap("n", "<leader>l", ":Telescope find_files previewer=false <CR>", opts)
remap("n", "<leader>;", ":Telescope buffers previewer=false <CR>", opts)
remap("n", "<leader>f.", ":Telescope find_files cwd=%:h <CR>", opts)
remap("n", "<leader>fs", ":Telescope lsp_document_symbols symbols='method' <CR>", opts)
remap("n", "<leader>fd", ":Telescope lsp_document_diagnostics <CR>", opts)
remap("n", "<leader>fn", ":Telescope find_files cwd=~/.config/nvim <CR>", opts)
remap("n", "<leader>fo", ":Telescope oldfiles <CR>", opts)
remap("n", "<leader>fgr", ":Telescope live_grep <CR>", opts)
remap("n", "<leader>ff", ":Telescope <CR>", opts)
