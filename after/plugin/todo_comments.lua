local status_ok, todo_comments = pcall(require, "todo-comments")

if not status_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes.")
	return
end

todo_comments.setup({})

-- Map key
local k = require("hn275.util.keymap").keymap
k("n", "<leader>ft", vim.cmd.TodoQuickFix)
