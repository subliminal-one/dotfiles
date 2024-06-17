local telescope = require('telescope')
local builtin = require("telescope.builtin")
local actions = require('telescope.actions')

telescope.setup{
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
      },
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<C-["] = actions.close,
        ["<ESC>"] = actions.close,
        ["<C-u>"] = false,
      },
      n = {
        ["<C-["] = actions.close,
        ["<ESC>"] = actions.close,
      },
    },
    layout_config = {
      horizontal = {
        width = 0.75,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    },
  }
}

require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")

-- Telescope
vim.keymap.set("n", "<leader>ss", "<cmd> Telescope<CR>")
vim.keymap.set("n", "<leader>sf", function() builtin.find_files() end)
vim.keymap.set("n", "<leader>sl", function() builtin.find_files({ cwd = "%:h" }) end)
vim.keymap.set("n", "<leader>sb", function() builtin.buffers({ sort_mru = true }) end)
vim.keymap.set("n", "<leader>so", function() builtin.oldfiles() end)
vim.keymap.set("n", "<leader>sd", function() builtin.diagnostics() end)
vim.keymap.set("n", "<leader>s.", function() builtin.find_files({ cwd = "~/.dotfiles" }) end)

vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find({
    sorting_strategy = "ascending",
    winblend = 10,
    previewer = false,
    layout_config = { width = 0.5, height = 0.8, },
  })
end, { desc = '[/] Fuzzily search in current buffer' })

