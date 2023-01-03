local tabline_ok, tabline = pcall(require, "tabline")

if not tabline_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes")
	return
end

tabline.setup({
	show_index = true,
	modified_icon = "[+]",
	close_icon = "",
	show_icon = false,
	separator = "|",
	padding = 1,
})
