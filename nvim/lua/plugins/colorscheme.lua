return {
  -- {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require("onedark").setup({
  --       style = "darker",
  --       colors = {
  --         fg = "#adb6c6",
  --         bg0 = "#1c1f24",
  --         -- yellow = "#e2ca5d",
  --         -- fg = "#d7d7d7",
  --         -- fg = "#ced2d9",
  --         -- cyan = "#1eaabb",
  --         -- green = "#85bd5c",
  --       },
  --       highlights = {
  --         TelescopeNormal = { bg = "$bg1", fg = "$fg" },
  --         TelescopeBorder = { bg = "$bg1", fg = "$bg1" },
  --         TelescopePromptNormal = { bg = "$bg2", fg = "fg1" },
  --         TelescopePromptBorder = { bg = "$bg2", fg = "$bg2" },
  --         TelescopePromptTitle = { bg = "$bg2", fg = "$bg2" },
  --         TelescopePreviewTitle = { bg = "$bg1", fg = "$bg1" },
  --         TelescopePreviewBorder = { bg = "$bg1", fg = "$bg1" },
  --         TelescopeResultsTitle = { bg = "$bg1", fg = "$bg1" },
  --         TelescopeResultsBorder = { bg = "$bg1", fg = "$bg1" },
  --       },
  --     })
  --     vim.cmd("colorscheme onedark")
  --   end,
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = true, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
