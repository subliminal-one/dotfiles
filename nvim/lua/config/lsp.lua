local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_lsp.default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "gra", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "grn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("n", "<leader><leader>fa", "<cmd>EslintFixAll<CR>", opts)
  end,
})

local servers = {

  intelephense = {
    init_options = {
      licenceKey = vim.env.INTELEPHENSE_KEY,
    },
  },

  cssls = {
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  },
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
  lspconfig[server].setup(config)
end
