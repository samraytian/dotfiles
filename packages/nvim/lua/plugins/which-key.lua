local which_key = require("which-key")

which_key.setup({})

which_key.add({
  { "<leader>f", group = "Find" },
  { "<leader>s", group = "Search" },
})

vim.keymap.set("n", "<leader>?", function()
  which_key.show({ global = false })
end, { desc = "Buffer local keymaps" })
