local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.cmdheight = 0
-- opt.cursorline = true
opt.expandtab = true
opt.formatoptions:remove("o")
opt.ignorecase = true
opt.inccommand = "split"
opt.jumpoptions = "stack"
opt.number = true
opt.pumheight = 20
opt.relativenumber = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.spell = true
opt.spelllang = { "en_us" }
opt.spelloptions = "camel"
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.updatetime = 100
opt.writebackup = false

vim.diagnostic.config({ virtual_text = true })
