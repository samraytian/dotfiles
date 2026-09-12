local telescope = require("telescope")

telescope.setup({
  extensions = {
    ["ui-select"] = require("telescope.themes").get_dropdown({}),
    frecency = {
      db_safe_mode = false,
      db_validate_threshold = 0,
      show_filter_column = false,
    },
  },
})

telescope.load_extension("ui-select")
telescope.load_extension("frecency")

local builtin = require("telescope.builtin")

local function project_root()
  return vim.fs.root(0, { ".git" }) or vim.fs.root(vim.fn.getcwd(), { ".git" }) or vim.fn.getcwd()
end

local function find_files()
  telescope.extensions.frecency.frecency({ cwd = project_root(), workspace = "CWD", hidden = true })
end

vim.keymap.set("n", "<leader><leader>", find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find recent files" })

vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search project text" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help tags" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search word under cursor" })
