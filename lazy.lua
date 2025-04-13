return {
	"zuberol/chaos.nvim",
	init = function()
		vim.filetype.add({
			extension	= {
				ch = "chaos",
				scr = "chaos",
				tldr = "chaos",
				reading = "chaos"
			}
		})
	end
}
