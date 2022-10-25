local file_extension = function()
	return vim.fn.expand("%:e")
end

local file_name_no_extension = function()
	return vim.fn.expand("%:p:r")
end

local file_name = function()
	return vim.fn.expand("%:p")
end

local dir_path = function()
	return vim.fn.expand("%:p:h")
end

local cmd = {
	["go"] = [[go run ]] .. file_name() .. [["]],
	["cpp"] = [[sh ]] .. dir_path() .. [[/compiler.sh]],
}

local M = {}

M.term = nil

M.init = function(terminal)
	M.term = terminal
end

M.exec = function()
	vim.cmd([[9TermExec cmd=" ]] .. cmd[file_extension()] .. [["]])
end

M.git = function()
	local lazygit = M.term:new({
		cmd = "lazygit",
		count = 8,
		hidden = false,
		direction = "float",
		close_on_exit = true,
		start_in_insert = true,
		on_open = function()
			vim.cmd("startinsert!")
		end,
	})
	return lazygit
end

return M
