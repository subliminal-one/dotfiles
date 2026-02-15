return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      input = { enabled = true },
      zen = { enabled = true },

      picker = {
        enabled = true,
        ui_select = true,
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
              ["<PageUp>"] = { "preview_scroll_up", mode = { "i", "n" } },
              ["<PageDown>"] = { "preview_scroll_down", mode = { "i", "n" } },
            },
          },
        },

        sources = {
          explorer = {
            auto_close = true,
          },
        },
      },

      explorer = {
        enabled = true,
      },
    },
  },
}
