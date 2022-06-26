local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local snippy = require("snippy")

local next = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif snippy.can_expand_or_advance() then
    snippy.expand_or_advance()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end, { "i", "s" })

local prev = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif snippy.can_jump(-1) then
    snippy.previous()
  else
    fallback()
  end
end, { "i", "s" })

cmp.setup{
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- ['<C-n>'] = next,
    -- ['<Tab>'] = next,
    -- ["<C-p>"] = prev,
    -- ["<S-Tab>"] = prev,
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'path' },
    { name = 'nvim_lua' },
  }),
}
