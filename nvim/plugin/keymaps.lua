local set = vim.keymap.set
local opts = { silent = true, nowait = true }

set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
set("x", "p", '"_dP')

set("n", "<c-h>", "<c-w>h", opts)
set("n", "<c-l>", "<c-w>l", opts)
set("n", "<c-j>", "<c-w>j", opts)
set("n", "<c-k>", "<c-w>k", opts)

set("n", "<space>e", vim.diagnostic.open_float, opts)
set("n", "<space>q", vim.diagnostic.setloclist, opts)

set("n", "<Tab>", function() vim.cmd("tabnext") end, opts)
set("n", "<S-Tab>", function() vim.cmd("tabprev") end, opts)
