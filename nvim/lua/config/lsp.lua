local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_lsp.default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
    -- if client and client.server_capabilities.inlayHintProvider then
    --     vim.lsp.inlay_hint(ev.buf, true)
    -- end

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    vim.keymap.set("n", "<space>fa", "<cmd>EslintFixAll<CR>", opts)
  end,
})

local servers = {

  intelephense = {
    init_options = {
      licenceKey = vim.env.INTELEPHENSE_KEY,
    },
  },

  tsserver = {},

  eslint = {},

  lua_ls = {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if
        not vim.loop.fs_stat(path .. "/.luarc.json")
        and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
      then
        client.config.settings =
          vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              library = { vim.env.VIMRUNTIME },
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            },
          })

        client.notify(
          "workspace/didChangeConfiguration",
          { settings = client.config.settings }
        )
      end
      return true
    end,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = { checkThirdParty = false },
        format = {
          enable = false,
        },
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = { enable = false },
      },
    },
  },

  tailwindcss = {
    filetypes = { "typescriptreact" },
  },
}

for server, config in pairs(servers) do
  config.capabilities = capabilities
  lspconfig[server].setup(config)
end
