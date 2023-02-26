require('neodev').setup()
local lspconfig = require('lspconfig');
local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_lsp.default_capabilities()

--[[ vim.lsp.set_log_level("TRACE") ]]

local on_attach = function(client, bufnr)
  -- Disable semantic tokens
  client.server_capabilities.semanticTokensProvider = nil

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Allow longer timeouts for prettier
  --[[ vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr(#{timeout_ms:2500})') ]]
  vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)

  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format({ bufnr = bufnr, async = true, })
  end, bufopts)
end

local null = require("null-ls");
null.setup({
  sources = {
    null.builtins.formatting.eslint_d,
    null.builtins.formatting.prettierd.with({
      extra_filetypes = { "php" },
    }),
  },
  debug = true,
})

local servers = {
  intelephense = {
    init_options = {
      licenceKey = vim.env.INTELEPHENSE_KEY,
    },
    handlers = {
      ["textDocument/formatting"] = function()
        vim.lsp.buf.format({ async = false, name = "null-ls" })
        vim.cmd.write()
      end
    },
  },
  tsserver = {
    handlers = {
      ["textDocument/formatting"] = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(bufnr)

        -- organize imports
        vim.lsp.buf_request_sync(0, 'workspace/executeCommand', {
          command = '_typescript.organizeImports',
          arguments = { bufname },
        })

        -- run prettier
        vim.lsp.buf.format({ async = false, name = "null-ls" })

        -- save file
        vim.cmd.write()
      end,
    },
  },
  eslint = {},
  cssls = {},
  html = {},
  marksman = {},
  lua_ls = {},
};

for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = capabilities;
  lspconfig[server].setup(config);
end
