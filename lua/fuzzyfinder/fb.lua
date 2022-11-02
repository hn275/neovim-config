local fb = require("telescope").extensions.file_browser.actions

return {
	hijack_netrw = true,
	mappings = {
		["n"] = {
			["a"] = fb.create,
			["d"] = fb.remove,
			["o"] = fb.open,
			["r"] = fb.rename,
		},
	},
}
