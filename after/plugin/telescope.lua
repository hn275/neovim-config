local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes.")
	return
end

local actions = require("telescope.actions")

local k = require("hn275.util.keymap").keymap

THEME = "ivy"

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["<Esc>"] = actions.close,
			},
		},
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
			theme = THEME,
		},
		find_files = {
			theme = THEME,
			no_ignore = true,
			hidden = true,
		},
		file_browser = {
			theme = THEME,
		},
		lsp_references = {
			theme = THEME,
		},
		buffers = {
			theme = THEME,
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

local t = require("telescope.builtin")
k("n", "<leader>ff", t.find_files)
k("n", "<leader>fg", t.live_grep)
k("n", "<leader>c", "<CMD>Telescope command_palette<CR>")
k("n", "<leader>fb", t.buffers)
