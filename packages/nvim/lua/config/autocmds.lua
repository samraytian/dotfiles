-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.hl.on_yank({ timeout = 200, on_visual = true })
	end,
})

-- Highlight the cursor line only in the active window
vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave" }, {
	group = vim.api.nvim_create_augroup("active_cursorline", { clear = true }),
	desc = "show cursorline only in the active window",
	callback = function(args)
		vim.opt_local.cursorline = args.event == "WinEnter"
	end,
})

-- Disable automatic comment continuation on new lines
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
	group = vim.api.nvim_create_augroup("no_comment_continuation", { clear = true }),
	desc = "disable comment continuation with Enter and o/O",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

-- Open help windows in a vertical split
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
	pattern = "help",
	desc = "open help in a right-hand vertical split",
	callback = function()
		vim.cmd("wincmd L")
	end,
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})
