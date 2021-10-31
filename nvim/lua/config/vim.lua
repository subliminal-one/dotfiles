vim.g.mapleader        = ' '

vim.opt.clipboard:append('unnamedplus')
vim.opt.completeopt    = 'menu,menuone,noselect'
vim.opt.conceallevel   = 2
vim.opt.cursorline     = true
vim.opt.expandtab      = true
vim.opt.fillchars      = 'fold: '
vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod     = 'expr'
vim.opt.list           = true
vim.opt.listchars      = 'eol:↵,trail:.'
vim.opt.number         = true
vim.opt.pumheight      = 20
vim.opt.relativenumber = true
vim.opt.shiftround     = true
vim.opt.shiftwidth     = 4
vim.opt.signcolumn     = 'yes'
vim.opt.softtabstop    = 4
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.swapfile       = false
vim.opt.tabstop        = 4
vim.opt.termguicolors  = true
vim.opt.updatetime     = 300
vim.opt.wildmenu       = true
vim.opt.wildmode       = 'longest:full,full'
vim.opt.wrap           = false
vim.opt.writebackup    = false

-- vim.opt.mouse          = 'a'
-- vim.opt.shortmess:append('c')
