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
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/rcarriga/nvim-notify",
  "https://github.com/folke/noice.nvim",

  -- LSP, Completion, Formatting

  -- Utilities
  "https://github.com/nvim-lua/plenary.nvim",
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
require("plugins.lualine")
require("plugins.noice")
require("plugins.oil")
require("plugins.telescope")
