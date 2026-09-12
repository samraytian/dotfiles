require("noice").setup({
  -- Native ui2 and tiny-cmdline own the command line and messages.
  cmdline = { enabled = false },
  messages = { enabled = false },
  popupmenu = { enabled = false },
  notify = {
    view = "notify",
  },
  lsp = {
    signature = { enabled = false }, -- blink.cmp provides signature help.
  },
  presets = {
    lsp_doc_border = true,
  },
})
