local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    rust = { "rustfmt" },
    swift = { "swift_format" },
    dart = { "dart_format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },
  default_format_opts = { lsp_format = "fallback" },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat or vim.bo[bufnr].buftype ~= "" then
      return
    end
    return { timeout_ms = 1500, lsp_format = "fallback" }
  end,
})

vim.keymap.set({ "n", "x" }, "<leader>cf", function()
  conform.format({ timeout_ms = 3000 })
end, { desc = "Format buffer or selection" })

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, { bang = true, desc = "Disable autoformat globally (! for current buffer)" })

vim.api.nvim_create_user_command("FormatEnable", function(args)
  if args.bang then
    vim.b.disable_autoformat = false
  else
    vim.g.disable_autoformat = false
  end
end, { bang = true, desc = "Enable autoformat globally (! for current buffer)" })
