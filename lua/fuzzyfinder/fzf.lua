local fzf_ok, fzf = pcall(require, "fzf-lua")
if not fzf_ok then
	error("FAILED: fzf-lua not found")
	return
end

fzf.setup({
	winopts = {
		split = "belowright new",
		border = "single",

		preview = {
			wrap = "wrap",
			layout = "horizontal",
		},
	},
})

local k = require("util.keymap").keymap
k("n", "<leader>ff", "<CMD>FzfLua files<CR>")
k("n", "<leader>fg", "<CMD>FzfLua live_grep_resume<CR>")
