return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      -- "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      -- "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("config.completion")
    end,
  },

  -- {
  --   "saghen/blink.cmp",
  --   lazy = false, -- lazy loading handled internally
  --   version = "v0.*",
  --   opts = {
  --     highlight = {
  --       use_nvim_cmp_as_default = true,
  --     },
  --     nerd_font_variant = "mono",
  --     -- experimental auto-brackets support
  --     -- accept = { auto_brackets = { enabled = true } }
  --
  --     -- experimental signature help support
  --     -- trigger = { signature_help = { enabled = true } }
  --     keymap = {
  --       show = "<C-space>",
  --       hide = "<C-e>",
  --       accept = "<CR>",
  --       select_prev = { "<Up>", "<C-p>" },
  --       select_next = { "<Down>", "<C-n>" },
  --
  --       show_documentation = "<C-space>",
  --       hide_documentation = "<C-space>",
  --       scroll_documentation_up = "<C-b>",
  --       scroll_documentation_down = "<C-f>",
  --
  --       snippet_forward = "<Tab>",
  --       snippet_backward = "<S-Tab>",
  --     },
  --
  --     sources = {
  --       providers = {
  --         { "blink.cmp.sources.lsp", name = "LSP" },
  --         -- { 'blink.cmp.sources.path', name = 'Path', score_offset = 3 },
  --         {
  --           "blink.cmp.sources.snippets",
  --           name = "Snippets",
  --           score_offset = -3,
  --         },
  --         {
  --           "blink.cmp.sources.buffer",
  --           name = "Buffer",
  --           fallback_for = { "LSP" },
  --         },
  --       },
  --     },
  --   },
  -- },
}
