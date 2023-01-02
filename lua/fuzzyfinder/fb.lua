local fb = require("telescope").extensions.file_browser.actions

return {
	hijack_netrw = true,
	mappings = {
		["n"] = {
			["<C-n>"] = fb.create,
			["d"] = fb.remove,
			["r"] = fb.rename,
			["u"] = fb.goto_parent_dir,
		},
	},
}
