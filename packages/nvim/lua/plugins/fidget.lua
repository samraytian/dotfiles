require("fidget").setup({
  progress = {
    display = {
      done_ttl = 3,
    },
  },
  notification = {
    -- Keep general notifications and their history in nvim-notify.
    override_vim_notify = false,
    window = {
      winblend = 100,
      align = "bottom",
      h_align = "right",
    },
  },
})
