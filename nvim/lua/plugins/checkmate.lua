return {
  {
    "bngarren/checkmate.nvim",
    ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
    opts = {
      enter_insert_after_new = false, -- Should enter INSERT mode after `:Checkmate create` (new todo)
      keys = {
        ["<leader>ti"] = {
          rhs = "<cmd>Checkmate create<CR>",
          desc = "Create todo item",
          modes = { "n", "v" },
        },
        ["<leader>tr"] = {
          rhs = "<cmd>Checkmate remove<CR>",
          desc = "Remove todo marker (convert to text)",
          modes = { "n", "v" },
        },
        ["<leader>to"] = {
          rhs = "<cmd>Checkmate toggle<CR>",
          desc = "Toggle todo",
          modes = { "n", "v" },
        },
        ["<leader>td"] = {
          rhs = "<cmd>Checkmate metadata toggle done<CR>",
          desc = "Toggle done",
          modes = { "n", "v" },
        },
      },
    },
  },
}
