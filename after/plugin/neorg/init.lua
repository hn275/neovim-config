local status, neorg = pcall(require, "neorg")

if not status then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},

		["core.norg.qol.toc"] = {
			config = {
				close_split_on_jump = false,
				toc_split_placement = "left",
				default_toc_mode = "split",
			},
		},

		["core.norg.dirman"] = {
			config = {
				workspaces = {
					school = "~/Schools",
				},
			},
		},

		["core.norg.concealer"] = {
			config = {
				dim_code_blocks = {
					-- width = "content",
					conceal = true,
				},
			},
		},

		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
	},
})
