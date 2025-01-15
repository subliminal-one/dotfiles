return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { "~/.dotfiles/nvim" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/lazydev.nvim" },
    config = function()
      require("config/lsp")
    end,
  },
}
