local gh_ok, gh = pcall(require, "github-theme")

if not gh_ok then
	print("FAILED: github theme")
	return
end

gh.setup({
	theme_style = "dark_default",
	variable_style = "NONE",
	keyword_style = "italic",
	function_style = "bold",
})
