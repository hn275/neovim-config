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

local cmd = function()
	local ft = {
		["go"] = [[go run ]] .. file_name() .. [["]],
		["cpp"] = [[sh ]] .. dir_path() .. [[/compiler.sh]],
	}

	for k, v in pairs(ft) do
		if k == file_extension() then
			return v
		end
	end

	return error("Execution for this filetype has not been configured")
end

local M = {}

M.term = nil

M.init = function()
	local Term = require("toggleterm.terminal").Terminal
	M.term = Term
end

M.exec = function()
	vim.cmd([[9TermExec cmd=" ]] .. cmd() .. [["]])
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
	lazygit:toggle()
end

return M
