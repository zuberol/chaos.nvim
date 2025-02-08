vim.filetype.add({
	extension	= {
		ch = "chaos",
		scr = "chaos"
	}
})
require('chaos.search')

CHAOS_TAGS_PATH = "~/.config/chaos/tags"
local uv = vim.uv or vim.loop
vim.keymap.set('n', '<leader>hn', function()
	local stdin = uv.new_pipe()
	local stdout = uv.new_pipe()
	local stderr = uv.new_pipe()
	local current_buffer_name = vim.fn.expand('%:p')
	local handle, pid = uv.spawn('/Users/jzuber/go/bin/chaos', {
		stdio = { stdin, stdout, stderr },
		args = {
			current_buffer_name,
			vim.fn.expand(CHAOS_TAGS_PATH)
		}
	})

	uv.read_start(stdout, function(err, data)
		assert(not err, err)
		if data then
			print("stdout chunk", stdout, data)
			vim.defer_fn(function()
				vim.fn.setreg('"', data)
			end, 100)
		else
			print("stdout end", stdout)
		end
	end)

	uv.read_start(stderr, function(err, data)
		assert(not err, err)
		if data then
			print("stderr chunk", stderr, data)
		else
			print("stderr end", stderr)
		end
	end)

	uv.write(stdin, vim.fn.getreg('"'))

	uv.shutdown(stdin, function()
		uv.close(handle, function()
			print("process closed", handle, pid)
		end)
	end)
end, { desc = "chaos new id drop" })

vim.keymap.set('n', '<leader>hm', function()
	local stdin = uv.new_pipe()
	local stdout = uv.new_pipe()
	local stderr = uv.new_pipe()
	local handle, pid = uv.spawn('./venv/bin/python3.12', {
		stdio = { stdin, stdout, stderr },
		args = {
			'gitdiffer',
			'--move'
		},
		cwd = '/opt/chaos/bin/gitdiffer'
	})
	uv.read_start(stdout, function(err, data)
		assert(not err, err)
		if data then
			print("stdout chunk", stdout, data)
			vim.defer_fn(function()
				vim.fn.setreg('"', data)
			end, 1000)
		else
			print("stdout end", stdout)
		end
	end)
	uv.read_start(stderr, function(err, data)
		assert(not err, err)
		if data then
			print("stderr chunk", stderr, data)
		else
			print("stderr end", stderr)
		end
	end)
	uv.write(stdin, vim.fn.getreg('"'))
	uv.shutdown(stdin, function()
		uv.close(handle, function()
			print("process closed", handle, pid)
		end)
	end)
end, { desc = "chaos move" })
