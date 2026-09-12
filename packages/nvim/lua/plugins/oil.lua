-- Close Oil with Ctrl-c in normal mode (default keymap).
-- Toggle file preview with Ctrl-p in normal mode (default keymap).
require("oil").setup({
	default_file_explorer = true,

	keymaps = {
		["q"] = { "actions.close", mode = "n" },
	},

	columns = {
		"icon",
	},

	view_options = {
		show_hidden = true,
	},

	win_options = {
		signcolumn = "yes:2",
	},

	float = {
		padding = 2,
		max_width = 0.8,
		max_height = 0.8,
		border = "rounded",
	},

	skip_confirm_for_simple_edits = false,
})

require("oil-git-status").setup()

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
	desc = "Open parent directory",
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", {
	desc = "Open file explorer",
})
