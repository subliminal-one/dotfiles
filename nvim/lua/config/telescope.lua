local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
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
      },
      n = {
        ["<C-["] = actions.close,
        ["<ESC>"] = actions.close,
      },
    },
    layout_config = {
      horizontal = { width = 0.75 },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
