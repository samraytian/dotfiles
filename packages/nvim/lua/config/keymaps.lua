-- Disable Space's default motion because it is reserved for <leader> mappings.
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Clear search highlights until the next search.
vim.keymap.set("n", "<leader>l", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Pair u (undo) with U (redo), replacing U's default line-undo behavior.
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

vim.keymap.set({ "n", "x", "o" }, "gl", "$", { desc = "Go to end of line" })

-- Save without switching modes.
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>write<CR>", { desc = "Save file" })

-- Wipe the current buffer.
vim.keymap.set("n", "<C-c>", "<Cmd>bwipeout<CR>", { desc = "Wipe buffer" })

-- Move selected lines and keep the selection.
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Navigate split windows.
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- TODO: Bind Ctrl-r to find recently opened projects.
