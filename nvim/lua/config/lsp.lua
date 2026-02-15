local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_lsp.default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.document_color.enable(false)

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = args.buf }
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader><leader>fa", "<cmd>LspEslintFixAll<CR>", opts)
  end,
})

local servers = {
  intelephense = {
    init_options = {
      licenceKey = vim.env.INTELEPHENSE_KEY,
    },
  },

  -- cssls = {
  --   settings = {
  --     css = {
  --       validate = true,
  --       lint = {
  --         unknownAtRules = "ignore",
  --       },
  --     },
  --   },
  -- },

  ts_ls = {},
  eslint = {},

  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },

  tailwindcss = {
    filetypes = { "typescriptreact" },
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            {
              "(?:twMerge|twJoin)\\(([^;]*)[\\);]",
              "[`'\"`]([^'\"`;]*)[`'\"`]",
            },
          },
        },
      },
    },
  },
}

for server, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
