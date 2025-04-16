local chaos_group = vim.api.nvim_create_augroup("chaos", {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "chaos",
	group = chaos_group,
	desc = "load chaos highlights",
	callback = function(_)
		require'chaos.highlights'
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "load chaos window options",
	pattern = "chaos",
	group = chaos_group,
	callback = function()
		vim.wo.wrap = true
		vim.wo.breakindent = true
		vim.wo.linebreak = true
		vim.wo.showbreak = ">"
		vim.wo.breakindentopt = "shift:2"
	end,
})

