require("vim._core.ui2").enable({})

vim.g.mapleader = " "              -- space as leader key.
vim.g.maplocalleader = " "         -- space as local leader key.

vim.o.termguicolors = true         -- Enable 24-bit RGB colors in supported terminals.

vim.o.swapfile = false             -- Disable swap files for buffers.
vim.o.backup = false               -- Do not keep a backup file after overwriting a file.
vim.o.autoread = true              -- Reload externally changed files when the buffer has no unsaved changes.
vim.o.undofile = true              -- Persist undo history across editing sessions.

vim.o.number = true                -- Show the absolute line number on the cursor line with relativenumber enabled.
vim.o.relativenumber = true        -- Show relative line numbers on other lines for count-based motions.

vim.o.completeopt = "menu,preview" -- Show a menu for multiple matches and preview extra info when available.
vim.o.pumheight = 10               -- Limit the completion popup menu to 10 visible entries.
vim.o.winborder = "rounded"        -- Use rounded borders by default for floating windows.
vim.o.showmode = false             -- Hide the mode indicator in the command line.
vim.o.cursorline = true            -- Highlight the screen line containing the cursor.
vim.o.signcolumn = "yes"           -- Always reserve space for signs to prevent horizontal text shifts.
vim.o.ignorecase = true            -- Ignore case in search patterns by default.
vim.o.smartcase = true             -- Make searches case-sensitive when the pattern contains uppercase letters.
vim.o.incsearch = true             -- Show search matches while typing the pattern.

vim.o.tabstop = 2                  -- Display each tab character as 2 columns.
vim.o.shiftwidth = 2               -- Use 2 spaces for each indentation level.
vim.o.softtabstop = 2              -- Use 2-column tab stops when inserting tabs or pressing Backspace.
vim.o.autoindent = true            -- Copy the current line's indentation when starting a new line.
vim.o.expandtab = true             -- Insert spaces instead of tab characters.
vim.o.smartindent = true           -- Apply C-like automatic indentation when starting a new line.

vim.o.scrolloff = 8                -- Keep at least 8 lines above and below the cursor when possible.
vim.o.splitbelow = true            -- Open new horizontal splits below the current window.
vim.o.splitright = true            -- Open new vertical splits to the right of the current window.

vim.o.wrap = false                 -- Display long lines without wrapping.
vim.o.breakindent = true           -- Preserve indentation on wrapped lines if wrapping is enabled.

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
