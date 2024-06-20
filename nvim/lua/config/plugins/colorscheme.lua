return {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "cool",
      highlights = {
        TelescopeNormal = { bg = "$bg1", fg = "$fg" },
        TelescopeBorder = { bg = "$bg1", fg = "$bg1" },
        TelescopePromptNormal = { bg = "$bg2", fg = "fg1" },
        TelescopePromptBorder = { bg = "$bg2", fg = "$bg2" },
        TelescopePromptTitle = { bg = "$bg2", fg = "$bg2" },
        TelescopePreviewTitle = { bg = "$bg1", fg = "$bg1" },
        TelescopePreviewBorder = { bg = "$bg1", fg = "$bg1" },
        TelescopeResultsTitle = { bg = "$bg1", fg = "$bg1" },
        TelescopeResultsBorder = { bg = "$bg1", fg = "$bg1" },
      },
    })
    vim.cmd("colorscheme onedark")
  end,
}
