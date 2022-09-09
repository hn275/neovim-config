local neo_tree_status, neo_tree = pcall(require, "neo-tree")
if not neo_tree_status then
	return
end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
neo_tree.setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	window = {
		position = "float",
		mappings = {
			["o"] = "open",
			["i"] = "open_split",
			["s"] = "open_vsplit",
			["t"] = "open_tabnew",
			["C"] = "close_all_nodes",
			["a"] = {
				"add",
				config = {
					show_path = "none",
				},
			}, -- also accepts the optional config.show_path option like "add".
			["d"] = "delete",
			["r"] = "rename",
			["R"] = "refresh",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
			["<ESC>"] = "close_window",
		},
	},
	filesystem = {
		window = {
			mappings = {
				["<C-u>"] = "navigate_up",
			},
		},
	},
	buffers = {
		follow_current_file = true,
		window = {
			mappings = {
				["d"] = "buffer_delete",
				["<C-u>"] = "navigate_up",
			},
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["gA"] = "git_add_all",
				["gcp"] = "git_commit_and_push",
			},
		},
	},
})
