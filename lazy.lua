return {
	"zuberol/chaos.nvim",
	init = function()
		vim.filetype.add({
			extension	= {
				ch = "chaos",
				scr = "chaos",
				reading = "chaos"
			}
		})
	end
}
