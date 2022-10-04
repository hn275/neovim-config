local reach_status, reach = pcall(require, "reach")

if not reach_status then
	return
end

reach.setup()

local k = require("util.keymap").keymap

-- Marks ---
k("n", "<leader>mm", "<CMD>ReachOpen marks<CR>")
k("n", "<leader>mb", "<CMD>ReachOpen buffers<CR>")
k("n", "<leader>mt", "<CMD>ReachOpen tabpages<CR>")
k("n", "<leader>mc", "<CMD>ReachOpen colorschemes<CR>")
