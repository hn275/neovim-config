local theme_ok, theme = pcall(require, "onedark")

if not theme_ok then
	return
end

theme.setup({
	style = "dark",
	ending_tildes = false,
})

theme.load()
