local status, lspsaga = pcall(require, "lspsaga")

if not status then
	print("!lspsaga failed")
	return
end

lspsaga.init_lsp_saga({
	border_style = "rounded", -- single | double | rounded | bold | plus
	move_in_saga = {
		next = "<C-j>",
		prev = "<C-k>",
	},
	finder_action_keys = {
		quit = "<Escape>",
	},
	code_action_keys = {
		quit = "<Escape>",
		exec = "<Cr>",
	},
	code_action_lightbulb = {
		enable = false,
	},
	rename_action_quit = "<Escape>",
})
