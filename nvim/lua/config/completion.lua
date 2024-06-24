vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
lspkind.init({})

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }, {
    { name = "path" },
    { name = "buffer", keyword_length = 4 },
  }),

  mapping = cmp.mapping.preset.insert({
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Insert,
    }),
  }),
})
