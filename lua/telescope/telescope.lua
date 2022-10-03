local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
	return
end

local k = require("util.keymap").keymap

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		prompt_prefix = " > ",
		path_display = { "truncate" },
		preview = false,
		scroll_strategy = "limit",
	},
})

k("n", "<leader>ff", "<CMD>Telescope find_files theme=cursor<CR>")
k("n", "<leader>fg", "<CMD>Telescope live_grep theme=cursor<CR>")
k("n", "<leader>fb", "<CMD>Telescope buffers theme=cursor<CR>")
