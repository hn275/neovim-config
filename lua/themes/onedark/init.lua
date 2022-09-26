local status, onedark = pcall(require, "onedark")
if not status then
	print("!failed to load onedark theme")
	return
end
onedark.setup({
	style = "dark", -- acceptable values are: dark, darker, cool, deep, warm, warmer
	toggle_style_key = "<leader>z", -- toggle styles
})
onedark.load() -- set theme

require("themes.util.setlualine")("onedark")
