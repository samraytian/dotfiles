local neogit = require("neogit")

neogit.setup({
  integrations = {
    telescope = true,
  },
})

vim.keymap.set("n", "<leader>gg", function()
  neogit.open()
end, { desc = "Open Neogit" })
