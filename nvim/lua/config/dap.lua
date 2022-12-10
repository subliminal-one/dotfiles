local dap = require('dap')

--[[ dap.adapters.php = { ]]
--[[   type = 'executable', ]]
--[[   command = 'node', ]]
--[[   args = { '/home/mmyers/vscode-php-debug/out/phpDebug.js' }, ]]
--[[ } ]]
--[[]]
--[[ dap.configurations.php = { ]]
--[[   { ]]
--[[     name = 'xdebug', ]]
--[[     type = 'php', ]]
--[[     request = 'launch', ]]
--[[     port = 9003, ]]
--[[     log = true, ]]
--[[     serverSourceRoot = '/var/www/html', ]]
--[[     localSourceRoot = '/home/mmyers/projects/simplyphp/wellness-living/backend', ]]
--[[   }, ]]
--[[ } ]]

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

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    }
  }
end
