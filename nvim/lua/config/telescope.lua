local telescope = require('telescope')
local actions = require('telescope.actions');

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-["] = actions.close,
        ["<esc>"] = actions.close,
      },
      n = {
        ["<C-["] = actions.close,
        ["<esc>"] = actions.close,
      },
    },
    layout_config = {
      horizontal = {
        width = 0.75,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

-- Fix folding
--[[ vim.api.nvim_create_autocmd('BufRead', { ]]
--[[   callback = function() ]]
--[[     vim.api.nvim_create_autocmd('BufWinEnter', { ]]
--[[       once = true, ]]
--[[       command = 'normal! zx' ]]
--[[     }) ]]
--[[   end ]]
--[[ }) ]]
