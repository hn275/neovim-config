local getgit_ok, getgit = pcall(require, "git")

if not getgit_ok then
	return
end

getgit.setup()
local k = require("util.keymap").keymap
k("n", "<leader>G", "<CMD>GetGit<CR>")
