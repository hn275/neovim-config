local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	print("restart pls")
	return
end

local k = require("hn275.util.keymap").keymap

telescope.setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			vertical = { width = 0.5 },

			bottom_pane = {
				preview_cutoff = 40,
				prompt_position = "top",
			},

			cursor = {
				height = 0.9,
				preview_cutoff = 40,
				width = 0.8,
			},
		},
		prompt_prefix = " > ",
		path_display = { "truncate" },
		scroll_strategy = "limit",
		border = true,
	},
	pickers = {
		live_grep = {
			theme = "ivy",
		},
		find_files = {
			theme = "ivy",
		},
		file_browser = {
			theme = "ivy",
		},
	},
	extensions = {
		command_palette = {
			{
				"Github",
				{ "Issues", "Telescope gh issues" },
				{ "Pull Request", "Telescope gh pull_request" },
			},
			{
				"LSP",
				{ "Restart", "LspRestart" },
			},
		},
	},
})

telescope.load_extension("gh")
telescope.load_extension("command_palette")

k("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
k("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
k("n", "<leader>c", "<CMD>Telescope command_palette<CR>")
