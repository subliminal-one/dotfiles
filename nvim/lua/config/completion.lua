-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- vim.opt.shortmess:append("c")

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      -- vim.snippet.expand(args.body)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 3 },
  }),

  mapping = cmp.mapping.preset.insert({
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Insert,
    }),
  }),
})
