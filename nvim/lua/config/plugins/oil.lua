return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["<C-h>"] = false,
        },
      })

      vim.keymap.set("n", "-", "<cmd>Oil<cr>")
    end,
  },
}
