local theme_ok, theme = pcall(require, "onedark")

if not theme_ok then
	return
end

theme.setup({
	style = "dark",
	ending_tildes = true,
})
theme.load()

vim.cmd("hi MatchParen gui=bold guibg=none guifg=skyblue")
