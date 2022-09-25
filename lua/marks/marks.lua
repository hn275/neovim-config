local reach_status, reach = pcall(require, "reach")
local mark_status, marks = pcall(require, "marks")

if not (reach_status or mark_status) then
	return
end

marks.setup({
	default_mappings = true,
	builtin_marks = {},
	cyclic = false,
	force_write_shada = false,
	refresh_interval = 250,
	sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	excluded_filetypes = {},
	mappings = {},
})

reach.setup()

local k = require("util.keymap").keymap

-- Marks ---
k("n", "<leader>mm", "<CMD>ReachOpen marks<CR>")
k("n", "<leader>mb", "<CMD>ReachOpen buffers<CR>")
k("n", "<leader>mt", "<CMD>ReachOpen tabpages<CR>")
k("n", "<leader>mc", "<CMD>ReachOpen colorschemes<CR>")
