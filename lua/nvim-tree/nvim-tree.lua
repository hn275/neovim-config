require("nvim-tree").setup({
	auto_reload_on_write = true,
	sort_by = "name",
	view = {
		mappings = {
			list = {
				{ key = "<C-t>", action = "" },
				{ key = "o", action = "edit" },
				{ key = "s", action = "" },
				{ key = "t", action = "newtab" },
				{ key = "?", action = "toggle_help" },
			},
		},
	},
})
