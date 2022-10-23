local lspconfig = require('lspconfig');
local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Allow longer timeouts for prettier
  vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr(#{timeout_ms:2500})')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

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
    vim.lsp.buf.format({
      bufnr = bufnr,
      async = true,
      filter = function(client)
        return client.name ~= "tsserver"
      end,
    })
  end, bufopts)
end

lspconfig.intelephense.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    licenceKey = vim.env.INTELEPHENSE_KEY,
  },
}

-- null-ls, register before other servers so formatexpr picks this one.
local null = require("null-ls");
null.setup({
  sources = {
    null.builtins.formatting.prettier,
  },
  debug = true,
})

local servers = {
  'tsserver',
  'eslint',
  'html',
}

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
