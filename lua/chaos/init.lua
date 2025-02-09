vim.api.nvim_err_writeln("init or not ffs")
return {
	init = function()
		vim.filetype.add({
			extension	= {
				ch = "chaos",
				scr = "chaos",
				reading = "chaos"
			}
		})
	end,
	setup = function(opts)
		vim.api.nvim_err_writeln("running setup for chaos")
	end
}
