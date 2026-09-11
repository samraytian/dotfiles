-- Close Oil with Ctrl-c in normal mode (default keymap).
require("oil").setup({
	default_file_explorer = true,

	columns = {
		"icon",
	},

	view_options = {
		show_hidden = true,
	},

	win_options = {
		signcolumn = "yes:2",
	},

	skip_confirm_for_simple_edits = false,
})

require("oil-git-status").setup()

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
	desc = "Open parent directory",
})
