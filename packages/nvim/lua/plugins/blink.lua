local cmp = require("blink.cmp")

-- Build the Rust matcher on first install or after the plugin revision changes.
if not cmp.library_available() then
  if vim.fn.executable("cargo") == 1 then
    cmp.build():pwait(120000)
  else
    vim.schedule(function()
      vim.notify("blink.cmp: install Rust/Cargo for the Rust matcher; using Lua for now", vim.log.levels.WARN)
    end)
  end
end

cmp.setup({
  keymap = {
    preset = "default",
    ["<C-k>"] = {
      function()
        vim.lsp.buf.signature_help()
        return true
      end,
    },
  },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  fuzzy = { implementation = "prefer_rust" },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 250 },
    menu = { border = "rounded" },
  },
  signature = { enabled = false },
  cmdline = {
    completion = {
      menu = { auto_show = true },
      list = { selection = { preselect = false, auto_insert = false } },
      ghost_text = { enabled = false },
    },
  },
  term = { enabled = false },
})
