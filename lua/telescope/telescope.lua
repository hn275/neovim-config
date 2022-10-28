local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	return
end

local k = require("util.keymap").keymap

local cmd = require("telescope.cmd")
local fb = require("telescope.fb")

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
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
			theme = "ivy",
		},
		file_browser = {
			theme = "ivy",
		},
	},
	extensions = {
		command_palette = cmd,
		file_browser = fb,
	},
})

telescope.load_extension("gh")
telescope.load_extension("command_palette")
telescope.load_extension("file_browser")

k("n", "<leader>ff", "<CMD>Telescope find_files theme=ivy<CR>")
k("n", "<leader>fg", "<CMD>Telescope live_grep theme=ivy<CR>")
k("n", "<leader>t", "<CMD>Telescope file_browser <CR>")
