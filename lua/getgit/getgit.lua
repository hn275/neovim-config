local getgit_ok, getgit = pcall(require, "git")

if not getgit_ok then
	return
end

local k = require("util.keymap").keymap
getgit.setup()
k("n", "<leader>G", "<CMD>GetGit<CR>")
