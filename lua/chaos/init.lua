return {
	setup = function(opts)
		vim.filetype.add({
			extension	= {
				ch = "chaos",
				scr = "chaos",
				reading = "chaos"
			}
		})
	end,
	init = function(lazyPlugin)
		vim.api.nvim_err_writeln("fuck folke srolke")
	end
}
