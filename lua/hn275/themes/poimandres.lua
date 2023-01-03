local theme_ok, theme = pcall(require, "poimandres")

if not theme_ok then
	return
end

theme.setup({
	bold_vert_split = true,
	dim_nc_background = true,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,
})

vim.cmd([[
colorscheme poimandres
hi MatchParen gui=bold guibg=none guifg=cyan
]])
