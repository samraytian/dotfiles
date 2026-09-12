-- Upstream message.setup references _on_message, but some revisions only export
-- on_message. Alias it directly so registration and health checks use the same handler.
local lsp_message = require("noice.lsp.message")
if lsp_message._on_message == nil then
  lsp_message._on_message = lsp_message.on_message
end

require("noice").setup({
  -- Keep completion in blink.cmp; Noice handles LSP documentation.
  popupmenu = { enabled = false },
  cmdline = { enabled = true },
  messages = { enabled = true },
  notify = { enabled = true, view = "notify" },
  lsp = {
    progress = { enabled = true, view = "mini" },
    hover = { enabled = true },
    signature = { enabled = true },
    message = { enabled = true, view = "notify" },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  presets = {
    bottom_search = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },
  views = {
    cmdline_popup = {
      position = { row = "20%", col = "50%" },
    },
    mini = {
      timeout = 3000,
      win_options = { winblend = 100 },
    },
  },
})
