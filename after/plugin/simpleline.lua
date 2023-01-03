local simpleline_ok, simpleline = pcall(require, "simpleline")

if not simpleline_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes")
	return
end

simpleline.setup()
