require("lualine").setup({
	options = {
		icons_enabled = true,
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree" },
		always_divide_middle = true,
		globalstatus = false,
		theme = "auto", -- default theme
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
		lualine_z = { "location" },
	},
	tabline = {
		lualine_a = { {
			"tabs",
			max_length = vim.o.columns,
			mode = 1,
		} },
	},
})

-- Rename tab
local keymap = require("util.keymap").keymap
local tab_name = require("lualine.tab-rename")
keymap("n", "tn", tab_name)
