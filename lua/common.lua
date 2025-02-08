
local M = {}

local function on_failure_log(job_id, data, event)
	if data ~= nil and data ~= "" then
		if type(data) == "table" and #data == 0 and data[0] == "" then
			--vim.notify("failure ...", vim.log.levels.ERROR)
			--vim.notify(vim.inspect(job_id))
			--vim.notify(vim.inspect(data))
			--vim.notify(vim.inspect(event))
		end
	else 
		error(data)
	end
end

M.on_failure_log = on_failure_log

return M
