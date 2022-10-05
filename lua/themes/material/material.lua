local material_ok, material = pcall(require, "material")

if not material_ok then
	return
end

material.setup({
	contrast = {
		sidebars = true,
		floating_windows = false,
		popup_menu = false,
		non_current_windows = true,
	},

	italics = {
		comment = true,
	},

	high_visibility = {
		darker = true,
		lighter = true,
	},

	lualine_style = "stealth",
})

local setlualine = require("themes.util.setlualine")
setlualine("material")

vim.g.material_style = "deep ocean"
vim.cmd.colorscheme("material")
