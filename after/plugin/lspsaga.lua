local saga_ok, saga = pcall(require, "lspsaga")

if not saga_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes.")
	return
end

saga.init_lsp_saga({
	use_saga_diagnostic_sign = false,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		quit = "<ESC>",
		scroll_down = "<C-n>",
		scroll_up = "<C-p>",
	},
	code_action_prompt = {
		enable = false,
		virtual_text = false,
	},
	code_action_keys = {
		quit = "<ESC>",
		exec = "<CR>,",
	},
})
vim.cmd("Lspsaga toggle_virtual_text")
