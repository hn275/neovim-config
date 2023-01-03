local indent_ok, indent = pcall(require, "indent_blankline")

if not indent_ok then
	vim.cmd.PackerSync()
	print("Restart nvim")
	return
end

indent.setup({
	show_current_context = true,
	show_current_context_start = true,
})
