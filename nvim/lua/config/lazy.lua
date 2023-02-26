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
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/playground',
    },
    config = function()
      require('config/treesitter');
    end,
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('config/telescope')
    end,
  },

  -- language servers
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'j-hui/fidget.nvim',
      'jose-elias-alvarez/null-ls.nvim'
    },
    config = function()
      require('fidget').setup();
      require('config/lsp')
    end
  },

  -- completion
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
      require('config/completion')
    end,
  },

  -- status line
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = "onedark",
          component_separators = '',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diagnostics', },
          lualine_c = { { 'filename', path = 1 }, },
          lualine_x = { 'filetype' },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end
  },

  -- language specific
  { 'folke/neodev.nvim' },

  -- file tree
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup()
    end,
  },

  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        highlights = {
          TelescopePromptBorder = { fg = '$grey' },
          TelescopeResultsBorder = { fg = '$grey' },
        },
      }
      vim.cmd('colorscheme onedark')
    end,
  },

  {
    'rhysd/git-messenger.vim',
    event = 'InsertEnter',
  },

  {
    "folke/zen-mode.nvim",
    config = function()
      require('zen-mode').setup()
    end
  },

  -- trimming
  {
    'cappyzawa/trim.nvim',
    config = function()
      require('trim').setup({
        disable = { 'markdown' },
      })
    end,
  },

  -- Comments
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('config/comments')
    end,
  },

}, {})
