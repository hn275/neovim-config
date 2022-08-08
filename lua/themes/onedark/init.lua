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

-- setting lua line color
local lualine_status, lualine = pcall(require, "lualine")
if lualine_status then
	lualine.setup({
		options = {
			theme = "onedark",
		},
	})
else
	return
end
