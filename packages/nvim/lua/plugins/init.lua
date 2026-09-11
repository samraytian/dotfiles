vim.pack.add({
  -- File navigation
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/refractalize/oil-git-status.nvim",

  -- Appearance
  "https://github.com/folke/tokyonight.nvim",
})

require("plugins.colorscheme")
require("plugins.oil")
