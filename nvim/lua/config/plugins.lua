local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("nvim-treesitter.configs").setup({
        ignore_install = { "swift", "angular", "godot_resource", "gleam", "wgsl" },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = false,
        },

        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function() require('config/telescope') end,
  },

  {
    'neovim/nvim-lspconfig',
    config = function() require('config/lsp') end
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
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
          ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp', group_index = 1 },
          { name = 'luasnip' },
          { name = 'buffer',   group_index = 2, keyword_length = 4 },
          { name = 'nvim_lua' },
        }),
      })
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = "onedark",
          component_separators = '',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode', 'searchcount', 'selectioncount' },
          lualine_b = { 'branch', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 }, },
          lualine_x = { 'filetype' },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
    end,
  },

  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = "cool",
        highlights = {
          TelescopePromptBorder = { fg = '$grey' },
          TelescopePreviewBorder = { fg = '$grey' },
          TelescopeResultsBorder = { fg = '$grey' },
        },
      }
      vim.cmd('colorscheme onedark')
    end,
  },

  {
    'terrortylor/nvim-comment',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('nvim_comment').setup {
        comment_empty = false,
        hook = function()
          require('ts_context_commentstring.internal').update_commentstring()
        end,
      }
    end
  },

  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          css = { { "prettierd", "prettier" } },
          php = { { "prettierd", "prettier" } },
          html = { { "prettierd", "prettier" } },
          json = { { "prettierd", "prettier" } },
          yaml = { { "prettierd", "prettier" } },
          markdown = { "prettier" },
          typescript = { { "prettierd", "prettier" } },
          typescriptreact = { { "prettierd", "prettier" } },
        },
      });
    end
  }
}, {})
