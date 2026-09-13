local gitsigns = require("gitsigns")

gitsigns.setup({
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end, "Next Git hunk")
    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end, "Previous Git hunk")

    map("n", "<leader>gs", gitsigns.stage_hunk, "Stage / unstage hunk")
    map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")
    map("x", "<leader>gs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Stage / unstage selected lines")
    map("x", "<leader>gr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Reset selected lines")
    map("n", "<leader>gS", gitsigns.stage_buffer, "Stage buffer")
    map("n", "<leader>gp", gitsigns.preview_hunk, "Preview hunk")
    map("n", "<leader>gb", gitsigns.blame_line, "Blame current line")
    map("n", "<leader>gB", gitsigns.toggle_current_line_blame, "Toggle inline blame")
    map({ "o", "x" }, "ih", "<Cmd>Gitsigns select_hunk<CR>", "Select Git hunk")
  end,
})

require("diffview").setup({})

vim.keymap.set("n", "<leader>gd", "<Cmd>DiffviewOpen<CR>", { desc = "Open repository diff" })
vim.keymap.set("n", "<leader>gc", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
vim.keymap.set("n", "<leader>gh", "<Cmd>DiffviewFileHistory %<CR>", { desc = "Current file history" })
vim.keymap.set("n", "<leader>gH", "<Cmd>DiffviewFileHistory<CR>", { desc = "Repository file history" })

local neogit = require("neogit")

neogit.setup({
  integrations = {
    diffview = true,
    telescope = true,
  },
})

vim.keymap.set("n", "<leader>gg", function()
  neogit.open()
end, { desc = "Open Neogit" })
