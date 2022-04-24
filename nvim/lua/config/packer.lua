local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

return packer.startup(function()
  use { 'wbthomason/packer.nvim', opt = true }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'nvim-treesitter/playground',
    -- 'nvim-treesitter/nvim-treesitter-angular',
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "natecraddock/telescope-zf-native.nvim"

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'f3fora/cmp-spell',
    },
  }

  use 'neovim/nvim-lspconfig'
  use 'lspcontainers/lspcontainers.nvim'
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup();
    end,
  }
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'godlygeek/tabular'

  use 'sainnhe/everforest'
  use 'navarasu/onedark.nvim'

  use 'nvim-lualine/lualine.nvim'
  use 'rhysd/git-messenger.vim'
  use 'cappyzawa/trim.nvim'
  use '/home/mmyers/projects/nvim/flatliner.nvim'
  use '/home/mmyers/projects/nvim/boxer.nvim'
  use 'jwalton512/vim-blade'
  use 'gpanders/editorconfig.nvim'
  use {
    'stevearc/dressing.nvim',
    config = function ()
      require('dressing').setup({})
    end
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "main",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"
      },
  }
end)
