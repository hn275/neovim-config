return function(theme)
	if not theme then
		theme = "onedark"
	end

	local has_lualine, lualine = pcall(require, "lualine")
	if not has_lualine then
		print("Lualine failed to load")
		return
	end

	lualine.setup({
		options = {
			theme = theme,
		},
	})
end
