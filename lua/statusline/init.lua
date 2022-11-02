local lualine_ok, lualine = pcall(require, "lualine")
local tabline_ok, tabline = pcall(require, "luatab")

if not lualine_ok then
	print("FAILED: lualine")
else
	lualine.setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "|", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
	})
end

if tabline_ok then
	tabline.setup()
else
	print("tabline not installed")
end
