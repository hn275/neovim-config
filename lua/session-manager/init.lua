local k = require("util.keymap").keymap

local path = vim.fn.stdpath("data") .. "/sessions"

-- check for file existence at path/sessions
local f = io.popen("ls " .. path)

if f == nil then
	error("Failed to find session path")
	return
end

local output = f:read("*a")
if output ~= nil then
	local handle = io.popen("mkdir -p " .. path)
	if handle == nil then
		error("Failed to create a cache sesison dir")
	end
end

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { "*.*" },
	callback = function()
		vim.cmd("mksession! " .. path .. "/.cache_session.vim")
	end,
})

local picker = require("session-manager.finder")

k("n", "<leader>sf", picker.find_session)
k("n", "<leader>ss", picker.new_session)
k("n", "<leader>sd", picker.delete_session)
k("n", "<leader>sl", picker.last_session)
