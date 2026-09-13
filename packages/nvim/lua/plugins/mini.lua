require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.surround").setup({
  -- Keep s available for Flash without waiting for a longer mapping.
  mappings = {
    add = "gsa",
    delete = "gsd",
    find = "gsf",
    find_left = "gsF",
    highlight = "gsh",
    replace = "gsr",
  },
})
