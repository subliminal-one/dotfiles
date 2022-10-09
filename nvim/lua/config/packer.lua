vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

return packer.startup(function()
  use { 'wbthomason/packer.nvim', opt = true }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    { 'nvim-treesitter/playground' },
  }

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    { 'j-hui/fidget.nvim', config = function() require('fidget').setup(); end, },
    { 'jose-elias-alvarez/null-ls.nvim' },
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  }

  -- completion & snippets
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      --[[ 'hrsh7th/cmp-path', ]]
      'hrsh7th/cmp-nvim-lua',
    },
  }

  -- filetree
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
  }

  -- comments
  use {
    'numToStr/Comment.nvim',
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
  }

  -- ui / colors / syntax
  use {
    'navarasu/onedark.nvim',
    'nvim-lualine/lualine.nvim',
    'sainnhe/everforest',
    'Yazeed1s/minimal.nvim',
  }

  -- utilties
  use {
    'godlygeek/tabular',
    'rhysd/git-messenger.vim',
    'cappyzawa/trim.nvim',
    -- 'gpanders/editorconfig.nvim',
  }

  -- testing
  use {
    'mfussenegger/nvim-dap' ,
    'rcarriga/nvim-dap-ui',
  }

end)
