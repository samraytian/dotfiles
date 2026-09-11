---@diagnostic disable-next-line: undefined-global
local vim = vim -- Provided by the Neovim runtime.

require("vim._core.ui2").enable({})

-- Space as leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Neovide configurations.
if vim.fn.exists("g:neovide") == 1 then
  vim.opt.guifont = "JetBrainsMono Nerd Font:h14"

  -- Send Option key combinations to Neovim as Meta mappings.
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  -- Keep the native window chrome in dark mode.
  vim.g.neovide_theme = "dark"

  -- Neovide opacity settings.
  -- vim.g.neovide_opacity = 0.8
  -- vim.g.neovide_normal_opacity = 0.8
  -- vim.g.neovide_window_blurred = true
  -- vim.g.neovide_floating_blur_amount_x = 2.0
  -- vim.g.neovide_floating_blur_amount_y = 2.0
end
