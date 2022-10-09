-- Color configuration
vim.g.dracula_colors = {
	bg = "#282A36",
	fg = "#F8F8F2",
	selection = "#44475A",
	comment = "#6272A4",
	red = "#FF5555",
	orange = "#FFB86C",
	yellow = "#F1FA8C",
	green = "#50fa7b",
	purple = "#BD93F9",
	cyan = "#8BE9FD",
	pink = "#FF79C6",
	bright_red = "#FF6E6E",
	bright_green = "#69FF94",
	bright_yellow = "#FFFFA5",
	bright_blue = "#D6ACFF",
	bright_magenta = "#FF92DF",
	bright_cyan = "#A4FFFF",
	bright_white = "#FFFFFF",
	menu = "#21222C",
	visual = "#3E4452",
	gutter_fg = "#4B5263",
	nontext = "#3B4048",
}

local opt = {
	dracula_show_end_of_buffer = false, -- show '~' at the end of buffer
	dracula_transparent_bg = true,
	dracula_lualine_bg = "#44475a", -- color correction for lua line bg
	dracula_italic_comment = false,
}

for key, val in pairs(opt) do
	vim.api.nvim_set_var(key, val)
end

vim.cmd([[ colorscheme dracula ]])
