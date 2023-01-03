local autopair_ok, autopair = pcall(require, "nvim-autopairs")

if not autopair_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes")
	return
end

autopair.setup()
