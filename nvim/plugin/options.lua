local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.cmdheight = 0
-- opt.cursorline = true
opt.expandtab = true
opt.formatoptions:remove "o"
opt.ignorecase = true
opt.inccommand = "split"
opt.jumpoptions = "stack"
opt.number = true
opt.pumheight = 20
opt.relativenumber = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.spell = true
opt.spelloptions = "camel"
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.updatetime = 100
opt.writebackup = false

-- opt.foldmethod="expr"
-- opt.foldexpr="nvim_treesitter#foldexpr()"
-- opt.foldenable = false

-- vim.opt.fillchars = "fold: "
-- vim.opt.list = true
-- vim.opt.listchars = "eol:↵,trail:.,tab:>-"
-- vim.opt.softtabstop = 4
-- vim.opt.tabstop = 4
-- vim.opt.wildmenu = true
-- vim.opt.wildmode = "longest:full,full"
-- vim.opt.wrap = false
-- vim.opt.mouse = "a"
-- vim.opt.laststatus = 2
