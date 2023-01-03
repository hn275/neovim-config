return function(hl)
	-- fallback color
	local rgb = {
		fg = "#f3f3f3",
		bg = "#343434",
	}
	if not hl then
		return rgb
	end

	local hex = vim.api.nvim_get_hl_by_name(hl, true)
	if hex.foreground then
		rgb.fg = "#" .. string.format("%06x", hex.foreground)
	end

	if hex.background then
		rgb.bg = "#" .. string.format("%06x", hex.background)
	end

	return rgb
end
