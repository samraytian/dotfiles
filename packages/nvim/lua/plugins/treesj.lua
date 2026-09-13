local treesj = require("treesj")

treesj.setup({ use_default_keymaps = false })

vim.keymap.set("n", "<leader>cm", treesj.toggle, { desc = "Toggle split / join code" })
vim.keymap.set("n", "<leader>cs", treesj.split, { desc = "Split code block" })
vim.keymap.set("n", "<leader>cj", treesj.join, { desc = "Join code block" })
