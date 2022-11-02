local fzf_ok, _ = pcall(require, "fzf-lua")
if not fzf_ok then
	error("FAILED: fzf-lua not found")
	return
end

local k = require("util.keymap").keymap

k("n", "<leader>ff", "<CMD>FzfLua files<CR>")
k("n", "<leader>fg", "<CMD>FzfLua live_grep_resume<CR>")
