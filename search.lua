local common = require("chaos.common")
local on_failure_log = common.on_failure_log

local M = {}
local search_path = vim.fn.expandcmd("~chaos", { errmsg = true })

local function lines_to_qf(_, lines, _)
	local qf_items = {}
	for index, value in ipairs(lines) do
		if value ~= "" then
			table.insert(qf_items, {
				nr = index,
				text = value
			})
		end
	end
	vim.fn.setqflist({}, "r", { title = "$> ls .", items = qf_items, efm = "%f:%l:%c: %m" })
	vim.cmd([[copen]])
end

local function on_exit_nothing(_, exit_code, _)
	if exit_code ~= 0 then
		vim.notify("exited with status: " .. exit_code, vim.log.levels.ERROR)
	end
end

local function shell_out_to_qf(cmd)
	local opts = {
		on_stdout = lines_to_qf,
		on_stderr = on_failure_log,
		on_exit = on_exit_nothing,
		stdout_buffered = true,
		stderr_buffered = true
	}
	local chan_id = vim.fn.jobstart(cmd, opts)
	if chan_id <=0 then
		vim.notfy("Can't open channel", vim.log.levels.ERROR)
	end
end

local function shell_out(cmd, on_stdout)
	local opts = {
		on_stdout = on_stdout,
		on_stderr = on_failure_log,
		on_exit = on_exit_nothing,
		stdout_buffered = true,
		stderr_buffered = true
	}
	vim.fn.jobstart(cmd, opts)
end

local function shell_out_to_reg(cmd, prefix, suffix)
	local function write_unnamed_reg(_, data, _)
		local stdout_str = table.concat(data)
		local new_reg_content = prefix .. stdout_str .. suffix
		vim.notify(new_reg_content, vim.log.levels.INFO)
		vim.fn.setreg("", new_reg_content)
	end
	shell_out(cmd, write_unnamed_reg)
end

function M.find_workloads()
	local cmd = table.concat({
		[[egrep -Rnoi "^\s*\w+: .*" ]],
		search_path,
		"|",
		[[ egrep -vo "(snp|ref|hint|code|cite|p|remember|case|ex|fc|then|opt|take|thesis|res|caution|note):"]]
	}, " ")
	shell_out_to_qf(cmd)
end

function M.find_all_tags()
	local cmd = table.concat({
		[[egrep -hRio --binary-files=without-match '^[\s\t]*\w+: ']],
		search_path,
		"|",
		[[sed -r 's/^ *//g']],
		"|",
		[[sed -E 's/\: *$//g']],
		"|",
		"sort",
		"|",
		"uniq"
	}, " ")
	shell_out_to_qf(cmd)
end

function M.drop_timestamp()
	local cmd = [[date +"%F at %T"]]
	shell_out_to_reg(cmd)
end

function M.drop_tag_created_at()
	local cmd = [[date -I]]
	shell_out_to_reg(cmd, "#created_at(", ")")
end



-- set keymaps

vim.keymap.set('n', '<leader>hdc', function()
	M.drop_tag_created_at()
end, { desc = "drop tag #created_at [chaos]" })

vim.keymap.set('n', '<leader>hst', function()
	M.find_all_tags()
end, { desc = "find tags [chaos]" })

vim.keymap.set('n', '<leader>hsw', function()
	M.find_workloads()
end, { desc = "find workloads [chaos]" })






return M
