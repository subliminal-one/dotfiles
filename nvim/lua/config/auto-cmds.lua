vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {"*"},
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt_local.wrap = true
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.comments = "b:-"
      vim.opt_local.breakindent = true
      vim.opt_local.breakindentopt = "shift:2"
      vim.opt_local.formatoptions:append('cor')
      return
    end

    if vim.bo.filetype == "lua" then
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      return
    end

    local filetypes = { "php", "typescript", "typescriptreact" }
    for _,filetype in pairs(filetypes) do
      if (vim.bo.filetype == filetype) then
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.textwidth = 100
        vim.opt_local.cursorline = true
        vim.opt_local.colorcolumn = "103"
        return
      end
    end
  end,
})
