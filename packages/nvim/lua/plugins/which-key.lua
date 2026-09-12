local which_key = require("which-key")

which_key.setup({})

which_key.add({
  { "<leader>c", group = "Code" },
  { "<leader>f", group = "Find" },
  { "<leader>s", group = "Search" },
  { "<leader>x", group = "Diagnostics" },
})

vim.keymap.set("n", "<leader>?", function()
  which_key.show({ global = false })
end, { desc = "Buffer local keymaps" })
