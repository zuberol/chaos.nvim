vim.api.nvim_err_writeln("init 1 or not ffs")
return {
	init = function()
		vim.api.nvim_err_writeln("init 2 or not ffs")
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
