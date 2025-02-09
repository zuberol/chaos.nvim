vim.filetype.add({
	extension	= {
		ch = "chaos",
		scr = "chaos",
		reading = "chaos"
	}
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "chaos",
	callback = function(event)
		require'chaos.syntax.colors'.load_highlights(event)
	end,
	desc = "Chaos colors for filetype change"
})

vim.api.nvim_create_autocmd({"BufWinEnter", "BufEnter", "WinEnter"}, {
	pattern = { "*.scr", "*.ch" },
	callback = function(event)
		--vim.bo.filetype = "chaos"
		require'chaos.syntax.colors'.load_highlights(event)
	end,
	desc = "Chaos colors for file suffixes"
})
