vim.pack.add({
  -- File navigation
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/refractalize/oil-git-status.nvim",

  -- Fuzzy finding
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope-frecency.nvim",

  -- Appearance
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",

  -- Utilities
  "https://github.com/nvim-lua/plenary.nvim",
})

require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.oil")
require("plugins.telescope")
