local nebulous_ok, nebulous = pcall(require, "nebulous")

if not nebulous_ok then
	print("Failed to load theme Nebulous")
	return
end

nebulous.setup({
	variant = "midnight",
	disable = {
		endOfBuffer = true,
	},
	italic = {
		comments = true,
	},
})
