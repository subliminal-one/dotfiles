local telescope = require('telescope')
local actions = require('telescope.actions');
local action_set = require("telescope.actions.set")

local open_file = {
  hidden = true,
  attach_mappings = function(_)
    actions.select_default:enhance({
      post = function()
        vim.cmd(":normal! zx")
        if (vim.b.foldlevelstart) then
          vim.cmd(string.format(':setlocal foldlevel %s', vim.b.foldlevelstart))
        end
      end,
    })
    return true
  end,
}

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git" },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.75,
        width  = 0.75,
        preview_width = 0.45,
      },
    },
    mappings = {
      i = {
        ["<C-]>"] = actions.close,
        ["<esc>"] = actions.close,
      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
  },

  pickers = {
    buffers = open_file,
    find_files = open_file,
    file_browser = open_file,
    live_grep = open_file,
    oldfiles = open_file,
  },

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
    }
  },

})

require('telescope').load_extension('fzf')

local opts  = { noremap = true, silent = true }
local remap = vim.api.nvim_set_keymap

remap("n", "<leader>l", ":Telescope find_files previewer=false <CR>", opts)
remap("n", "<leader>L", ":Telescope find_files cwd=%:h previewer=false <CR>", opts)
remap("n", "<leader>;", ":Telescope buffers previewer=false <CR>", opts)
remap("n", "<leader>fs", ":Telescope lsp_document_symbols symbols='method' <CR>", opts)
remap("n", "<leader>fd", ":Telescope lsp_document_diagnostics <CR>", opts)
remap("n", "<leader>f.", ":Telescope find_files cwd=~/.dotfiles <CR>", opts)
remap("n", "<leader>fo", ":Telescope oldfiles <CR>", opts)
remap("n", "<leader>fgr", ":Telescope live_grep <CR>", opts)
remap("n", "<leader>ff", ":Telescope <CR>", opts)
remap("n", "<leader>fp", ":Telescope find_files cwd=~/.local/share/nvim/site/pack/packer/start <CR>", opts)
remap("n", "<leader>fgb", ":Telescope current_buffer_fuzzy_find <CR>", opts)
