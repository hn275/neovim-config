local onenord_ok, onenord = pcall(require, "onenord")

if not onenord_ok then
	return
end

onenord.setup({
	theme = "dark",
	borders = true,
	fade_nc = true,
	styles = {
		comments = "italic",
		strings = "NONE",
		keywords = "NONE",
		functions = "bold",
		variables = "bold",
		diagnostics = "undercurl",
	},
	disable = {
		background = false,
		cursorline = false,
		eob_lines = true,
	},
	inverse = {
		match_paren = false,
	},
})
