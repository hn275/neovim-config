local lspsaga_ok, lspsaga = pcall(require, "lspsaga")

if not lspsaga_ok then
	vim.cmd.PackerSync()
	print("restart nvim to apply changes.")
	return
end

lspsaga.init_lsp_saga({
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = "single",
	saga_winblend = 0,
	move_in_saga = { prev = "<C-p>", next = "<C-n>" },
	diagnostic_header = { " ", " ", " ", "ﴞ " },
	preview_lines_above = 0,
	max_preview_lines = 10,
	code_action_icon = "💡",
	code_action_num_shortcut = true,
	code_action_lightbulb = {
		enable = false,
		enable_in_insert = true,
		cache_code_action = true,
		sign = true,
		update_time = 150,
		sign_priority = 20,
		virtual_text = true,
	},
	finder_icons = {
		def = "  ",
		ref = "諭 ",
		link = "  ",
	},
	finder_request_timeout = 1500,
	finder_action_keys = {
		open = { "o", "<CR>" },
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = { "Q", "<ESC>" },
	},
	code_action_keys = {
		quit = "Q",
		exec = "<CR>",
	},
	definition_action_keys = {
		edit = "<C-c>o",
		vsplit = "<C-c>v",
		split = "<C-c>i",
		tabe = "<C-c>t",
		quit = "Q",
	},
	rename_action_quit = "<C-c>",
	rename_in_select = true,
	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = " ",
		show_file = true,
		file_formatter = "",
		click_support = false,
	},
	-- show outline
	show_outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		auto_enter = true,
		auto_preview = true,
		virt_text = "┃",
		jump_key = "o",
		auto_refresh = true,
	},
})
