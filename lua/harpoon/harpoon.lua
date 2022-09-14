local harpoon_status, harpoon = pcall(require, "harpoon")
if not harpoon_status then
	return
end

harpoon.setup({
	menu = {
		width = vim.api.nvim_win_get_width(0) - 20,
	},
	save_on_toggle = true,
})

local M = {}

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

M.add = function()
	harpoon_mark.add_file()
	print("Harpoon'd")
end

M.toggle = function()
	harpoon_ui.toggle_quick_menu()
end

M.next = function()
	harpoon_ui.next()
end

M.prev = function()
	harpoon_ui.prev()
end

return M
