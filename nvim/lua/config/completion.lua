local cmp = require('cmp')

cmp.setup{
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-y>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', group_index = 1, max_item_count = 15, option = { keyword_length = 3 } },
    { name = 'luasnip' },
    { name = 'nvim_lua', group_index = 1 },
    { name = 'buffer', group_index = 2, option = { keyword_length = 4 } },
  }),
}
