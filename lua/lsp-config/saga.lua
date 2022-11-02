local saga_ok, saga = pcall(require, "lspsaga")

if not saga_ok then
	error("FAILED: lspsaga not found")
	return
end

saga.setup({
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
