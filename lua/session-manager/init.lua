local k = require("util.keymap").keymap

local path = vim.fn.stdpath("data") .. "/sessions"

-- check for file existence at path/sessions
local f = io.popen("ls " .. path)

if f == nil then
	error("Can't execute zsh command")
	return
end

local output = f:read("*a")
if output ~= nil then
	local handle = io.popen("mkdir -p " .. path)
	if handle == nil then
		error("Cant create a new dir")
	end
end

-- key map
k("n", "<C-s>s", ":mksession! " .. path .. "/ ", { noremap = true }) -- TODO: change this to path, add NUI
k("n", "<C-s>l", "<CMD>source " .. path .. "/.cache_session.vim<CR>", { noremap = true })
k("n", "<C-s>d", ":!rm ~/.nvim/sessions/", { noremap = true })

vim.api.nvim_create_autocmd({ "VimLeave" }, {
	pattern = { "*.*" },
	callback = function()
		vim.cmd("mksession! " .. path .. "/.cache_session.vim")
	end,
})
