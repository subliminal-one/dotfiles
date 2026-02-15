local filetypes = {
  "bash",
  "c",
  "css",
  "csv",
  "dockerfile",
  "editorconfig",
  "gitcommit",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "nginx",
  "php",
  "phpdoc",
  "query",
  "sql",
  "ssh_config",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
  "zsh",
}

return {

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(filetypes)

      vim.api.nvim_create_autocmd("FileType", {
        desc = "User: enable treesitter highlighting",
        callback = function(ctx)
          -- highlights
          local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

          -- -- indent
          local noIndent = {}
          if hasStarted and not vim.list_contains(noIndent, ctx.match) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
          --
          -- if hasStarted then
          --   vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          --   vim.wo[0][0].foldmethod = "expr"
          -- end
        end,
      })
    end,
  },
}
