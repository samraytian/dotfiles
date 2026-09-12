local notify = require("notify")

notify.setup({
  render = "compact",
  stages = "fade",
  timeout = 3000,
})

-- Startup fallback; Noice takes over vim.notify after VimEnter and uses this renderer.
vim.notify = notify
