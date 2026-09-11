---@diagnostic disable-next-line: undefined-global
local vim = vim -- Provided by the Neovim runtime.

require("vim._core.ui2").enable({})

-- Space as leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
