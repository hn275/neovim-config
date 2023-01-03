local mason_ok, mason = pcall(require, "mason")

if not mason_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes.")
end

mason.setup()
