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
		require'chaos.highlights'
	end,
	desc = "Chaos colors for filetype change"
})
