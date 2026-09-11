---@diagnostic disable-next-line: undefined-global
local vim = vim -- Provided by the Neovim runtime.

vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

local undo = "setlocal tabstop< shiftwidth< softtabstop< expandtab<"
vim.b.undo_ftplugin = vim.b.undo_ftplugin and (vim.b.undo_ftplugin .. " | " .. undo) or undo
