vim.pack.add({
  -- File navigation
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/refractalize/oil-git-status.nvim",

  -- Appearance
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
})

require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.oil")
