return {
  "folke/zen-mode.nvim",
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>z", function()
      require("zen-mode").toggle()
    end)
  end,
}
