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
		lualine_c = {},
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
		lualine_a = {},
		lualine_b = { "filename" },
		lualine_c = { "diagnostics" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {
	-- 	lualine_a = {},
	-- 	lualine_b = {
	-- 		{
	-- 			"buffers",
	-- 			show_filename_only = true,
	-- 			show_modified_status = true,
	-- 			mode = 0,
	-- 		},
	-- 	},
	-- 	lualine_z = { {
	-- 		"tabs",
	-- 		mode = 0,
	-- 	} },
	-- },
	extensions = {},
})
