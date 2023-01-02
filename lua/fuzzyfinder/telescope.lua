local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	vim.cmd("PackerSync")
	print("restart pls")
	return
end

local k = require("util.keymap").keymap

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			vertical = { width = vim.o.columns },
		},
		prompt_prefix = " > ",
		path_display = { "truncate" },
		scroll_strategy = "limit",
		border = true,
	},
	pickers = {
		buffers = {
			theme = "cursor",
		},
		live_grep = {
			theme = "dropdown",
		},
		find_files = {
			theme = "dropdown",
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
