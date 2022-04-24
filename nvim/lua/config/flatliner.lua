local flatliner = require('flatliner');

flatliner.setup({
  filetypes = {
    markdown = {
      pattern = "^[#]+",
      style = "tree",
    },
  },
})
