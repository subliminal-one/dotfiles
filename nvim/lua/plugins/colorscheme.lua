return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        styles = {
          comments = { "italic" }, -- Change the style of comments
          conditionals = {},
        },
        highlight_overrides = {
          all = function()
            return {
              ["@module"] = { style = {} },
            }
          end,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
