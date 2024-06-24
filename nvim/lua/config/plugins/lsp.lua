return {
  { "folke/neodev.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("neodev").setup()
      require("config/lsp")
    end,
  },
}
