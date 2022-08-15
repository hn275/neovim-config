vim.cmd([[colorscheme tokyonight]])

-- setting lualine color theme
local lualine_status, lualine = pcall(require, "lualine")
if lualine_status then
	lualine.setup({
		options = {
			theme = "tokyonight",
		},
	})
else
	return
end
