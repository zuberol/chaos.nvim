local function load_highlights()
	local ns = vim.api.nvim_create_namespace("chaos")
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_hl_ns(win, ns)

	local hi_groups = {
		['chaosBrown'] = { fg = '#963604' },
		['chaosGreen'] = { fg = '#8af478' },
		['chaosPink'] = { fg = '#ff00ff' },
		['chaosOrange'] = { fg = '#ff4f0f' },
		['chaosNavy'] = { fg = '#171fd1' },
		['chaosBlue'] = { fg = '#59c2ff' },
		['chaosGolden'] = { fg = '#ff8200' },
		['chaosViolet'] = { fg = '#8c07dd' },
		['chaosDarkGrey'] = {fg = '#626a73'},
		['chaosRed'] = { fg = '#ff3333', bold = true },
		['chaosQuote'] = { fg = 'fg', italic = true },
		['chaosBacktickQuote'] = { fg = '#ff8200', italic = true },
		['chaosSectionOpen'] = { fg = '#ff8200', bold = true },
		['chaosSection'] = { fg = '#ff8200', bold = true },
		['chaosTag'] = { fg="#59c2ff", bold = true },
		['chaosLine'] = { link = 'Normal' },
		['chaosDumpBlock'] = { link = 'Normal' },
		['chaosSingleQuote'] = { fg="fg", italic=true },
		['chaosDumpType'] = { link = 'Comment' },
		['chaosDumpLine'] = { link = 'Normal' },
		['chaosProperties'] = { link = 'chaosNavy' },
		['chaosTags'] = { fg="#59c2ff", bold = true },
		['chaosBlockLine'] = { link = 'chaosPink' },
		['chaosBlock'] = { fg="fg" },
		['chaosType'] = { fg="fg", bold=true },
		['chaosDoubleQuote'] = { fg="fg", italic=true },
		['chaosEscapeQuote'] = { link = 'Normal' },
		['errorLine'] = { link = 'chaosPink' },
		['errorEmptySingleQuote'] = { link = 'chaosPink' },
		['errorEmptyDoubleQuote'] = { link = 'chaosPink' },
		['errorEmptyBacktickQuote'] = { link = 'chaosPink' },
		['errorDumpNoType'] = { link = 'chaosPink' },
		['chaosTry'] = { fg = '#ff4f0f', bold = true },
		['chaosData'] = { fg = '#59c2ff', bold = true },
		['chaosWorkload'] = { fg = '#ff4f0f', bold = true },
		['chaosMeta'] = { fg = '#ff8200', bold = true },
		['chaosTagGreen'] = { fg = '#8af478', bold = true },
	}

	for group, opts in pairs(hi_groups) do
		vim.api.nvim_set_hl(ns, group, opts)
	end
	vim.api.nvim_win_set_hl_ns(win, ns)
end
load_highlights()
