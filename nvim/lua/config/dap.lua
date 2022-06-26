local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/mmyers/vscode-php-debug/out/phpDebug.js' },
}

dap.configurations.php = {
  {
    name = 'xdebug',
    type = 'php',
    request = 'launch',
    port = 9003,
    log = true,
    serverSourceRoot = '/var/www/html',
    localSourceRoot = '/home/mmyers/projects/simplyphp/wellness-living/backend',
  },
}

require('dapui').setup()

vim.keymap.set('n', '<F4>', ":lua require'dapui'.toggle()<CR>")
vim.keymap.set('n', '<F5>', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<F6>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<F9>', ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', '<F10>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<F11>', ":lua require'dap'.step_out()<CR>")
-- nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
-- nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
-- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
