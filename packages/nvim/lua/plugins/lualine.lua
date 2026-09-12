require("lualine").setup({
  options = {
    globalstatus = true,
    icons_enabled = false,
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(mode)
          return mode:sub(1, 1)
        end,
      },
    },
    lualine_b = {
      {
        "branch",
        icons_enabled = true,
        icon = "",
      },
      {
        "diff",
        icons_enabled = true,
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
      },
      {
        "diagnostics",
        icons_enabled = true,
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = "󰌵 ",
        },
      },
    },
    lualine_c = {
      {
        "filetype",
        icons_enabled = true,
        icon_only = true,
        separator = "",
        padding = { left = 1, right = 0 },
      },
      { "filename", path = 1, padding = { left = 0, right = 1 } },
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
