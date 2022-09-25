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

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

local add = function()
	harpoon_mark.add_file()
	print("Harpoon'd")
end

local toggle = function()
	harpoon_ui.toggle_quick_menu()
end

local k = require("util.keymap").keymap
k("n", "<leader>hm", add, { noremap = true })
k("n", "<leader>ht", toggle)
