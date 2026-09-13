vim.pack.add({
  -- Shared dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",

  -- Appearance
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/mawkler/modicator.nvim",

  -- UI and keybinding hints
  "https://github.com/rcarriga/nvim-notify",
  "https://github.com/folke/noice.nvim",
  "https://github.com/folke/which-key.nvim",

  -- File navigation
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/refractalize/oil-git-status.nvim",

  -- Fuzzy finding
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope-frecency.nvim",

  -- Editing
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/folke/flash.nvim",

  -- Syntax
  "https://github.com/nvim-treesitter/nvim-treesitter",

  -- Language tooling
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/rachartier/tiny-code-action.nvim",

  -- Diagnostics
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
  "https://github.com/artemave/workspace-diagnostics.nvim",

  -- Git
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/NeogitOrg/neogit",
})

-- Clean up plugins removed from the declarations above.
local inactive_plugins = {}
for _, plugin in ipairs(vim.pack.get(nil, { info = false })) do
  if not plugin.active then
    table.insert(inactive_plugins, plugin.spec.name)
  end
end
if #inactive_plugins > 0 then
  vim.pack.del(inactive_plugins)
  vim.schedule(function()
    vim.notify("Removed unused plugins: " .. table.concat(inactive_plugins, ", "), vim.log.levels.INFO)
  end)
end

require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.notify")
require("plugins.lualine")
require("plugins.misc")
require("plugins.mini")
require("plugins.flash")
require("plugins.blink")
require("plugins.diagnostics")
require("plugins.lsp")
require("plugins.conform")
require("plugins.oil")
require("plugins.telescope")
require("plugins.git")
require("plugins.which-key")
