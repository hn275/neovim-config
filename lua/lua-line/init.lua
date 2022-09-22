require("lualine").setup({
	options = {
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
		theme = "codedark", -- default theme
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{
				"filename",
				path = 0,
				symbols = {
					unnamed = "blank",
					newfile = "new",
				},
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
				update_in_insert = true,
			},
		},
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { {
			"filename",
			path = 1,
		} },
		lualine_b = { "diagnostics" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {
		lualine_a = { {
			"tabs",
			mode = 3,
		} },
		lualine_b = {},
		lualine_z = {},
	},
	extensions = {},
})
