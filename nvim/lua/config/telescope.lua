local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    winblend = 10,
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
      horizontal = { width = 0.75 },
    },
    file_ignore_patterns = {
      "%.gif",
      "%.svg",
      "%.png",
      "%.jpg",
      "%.jpeg",
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
      },
    },
  },
  extensions = {
    fzf = {},
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
