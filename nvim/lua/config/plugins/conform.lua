return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        css = { "prettier", "trim_whitespace", "trim_newlines" },
        php = { "prettier", "trim_whitespace", "trim_newlines" },
        lua = { "stylua" },
        html = { { "prettierd", "prettier" } },
        json = { "prettier" },
        yaml = { { "prettierd", "prettier" } },
        -- markdown = { "prettier" },
        javascript = { "prettier", "trim_whitespace", "trim_newlines" },
        javascriptreact = { "prettier", "trim_whitespace", "trim_newlines" },
        typescript = { "prettier", "trim_whitespace", "trim_newlines" },
        typescriptreact = { "prettier", "trim_whitespace", "trim_newlines" },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
