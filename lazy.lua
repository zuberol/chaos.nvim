return {
	"zuberol/chaos.nvim",
	init = function()
		vim.api.nvim_err_writeln("hello init")
		vim.filetype.add({
			extension	= {
				ch = "chaos",
				scr = "chaos",
				reading = "chaos"
			}
		})
	end
}
