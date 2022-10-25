local term_ok, term = pcall(require, "toggleterm")

if not term_ok then
	print("not loaded: toggleterm")
	return
end

term.setup({
	open_mapping = [[<C-t>]],
	start_in_insert = false,
	shade_terminals = false,
	insert_mappings = false,
})

local Term = require("toggleterm.terminal").Terminal
require("toggleterm.util").init(Term)
local exec = require("toggleterm.util").exec
vim.api.nvim_create_user_command("Exec", exec, {})

local git = require("toggleterm.util").git()
local git_toggler = function()
	git:toggle()
end
vim.api.nvim_create_user_command("Git", git_toggler, {})
