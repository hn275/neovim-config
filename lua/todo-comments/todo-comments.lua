local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	print("!failed to load todo comment")
	return
end

todo_comments.setup({})
