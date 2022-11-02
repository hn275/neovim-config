local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	return
end

local k = require("util.keymap").keymap
local fb = require("fuzzyfinder.fb")

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			vertical = { width = vim.o.columns },
		},
		prompt_prefix = " > ",
		path_display = { "truncate" },
		scroll_strategy = "cycle",
		border = true,
	},
	pickers = {
		buffers = {
			theme = "cursor",
		},
		live_grep = {
			theme = "dropdown",
		},
		find_file = {
			theme = "dropdown",
		},
		file_browser = {
			theme = "dropdown",
		},
	},
	extensions = {
		file_browser = fb,
	},
})

telescope.load_extension("gh")
telescope.load_extension("file_browser")

k("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
k("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
k("n", "<leader>t", "<CMD>Telescope file_browser<CR>")
