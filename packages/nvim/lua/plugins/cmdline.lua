local cmdline = require("tiny-cmdline")

cmdline.setup({
  position = {
    y = "20%",
  },
  on_reposition = cmdline.adapters.blink,
})

local function enable_ui()
  require("vim._core.ui2").enable({})
end

-- Embedded UIs attach after init.lua; headless sessions need stdout messages.
if #vim.api.nvim_list_uis() > 0 then
  enable_ui()
else
  vim.api.nvim_create_autocmd("UIEnter", {
    group = vim.api.nvim_create_augroup("native_cmdline", { clear = true }),
    once = true,
    callback = enable_ui,
  })
end
